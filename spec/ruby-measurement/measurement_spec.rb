# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  subject { described_class }

  describe '.new' do
    describe 'with valid quantity' do
      it 'sets the quantity' do
        expect(subject.new(3).quantity).to eq 3
      end

      it 'sets the default unit' do
        expect(subject.new(3).unit).to eq subject::Unit[:count]
      end
    end

    describe 'with valid quantity and unit name' do
      it 'sets the quantity' do
        expect(subject.new(2, :dozen).quantity).to eq 2
      end

      it 'sets the unit' do
        expect(subject.new(2, :dozen).unit).to eq subject::Unit[:dozen]
      end
    end

    describe 'with valid quantity and unit' do
      it 'sets the quantity' do
        expect(subject.new(2, subject::Unit[:dozen]).quantity).to eq 2
      end

      it 'sets the unit' do
        expect(subject.new(2, subject::Unit[:dozen]).unit).to eq subject::Unit[:dozen]
      end
    end

    describe 'with invalid quantity' do
      it 'raises exception' do
        expect { subject.new('hi') }.to raise_error(ArgumentError)
      end
    end

    describe 'with invalid unit' do
      it 'raises exception' do
        expect { subject.new(3, :finklebaum) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.parse' do
    describe 'quantity' do
      it 'parses scientific notation' do
        m = subject.parse('4.3e12')
        expect(m.quantity).to eq 4.3e12
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('4.3e12 dozen')
        expect(m.quantity).to eq 4.3e12
        expect(m.unit).to eq Measurement::Unit[:dozen]

        m = subject.parse('4.3e12doz')
        expect(m.quantity).to eq 4.3e12
        expect(m.unit).to eq Measurement::Unit[:dozen]
      end

      it 'parses fractions' do
        m = subject.parse('1/4')
        expect(m.quantity).to eq 0.25
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('1/4 dozen')
        expect(m.quantity).to eq 0.25
        expect(m.unit).to eq Measurement::Unit[:dozen]

        m = subject.parse('1/4doz')
        expect(m.quantity).to eq 0.25
        expect(m.unit).to eq Measurement::Unit[:dozen]
      end

      it 'parses mixed fractions' do
        m = subject.parse('3 2/5')
        expect(m.quantity).to eq 3.4
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('3 2/5 dozen')
        expect(m.quantity).to eq 3.4
        expect(m.unit).to eq Measurement::Unit[:dozen]
      end

      it 'parses fractions with special characters' do
        m = subject.parse('⅜')
        expect(m.quantity).to eq 0.375
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('⅜ dozen')
        expect(m.quantity).to eq 0.375
        expect(m.unit).to eq Measurement::Unit[:dozen]

        m = subject.parse('⅜doz')
        expect(m.quantity).to eq 0.375
        expect(m.unit).to eq Measurement::Unit[:dozen]
      end

      it 'parses mixed fractions with special characters' do
        m = subject.parse('3⅜')
        expect(m.quantity).to eq 3.375
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('3 ⅜')
        expect(m.quantity).to eq 3.375
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('3⅜ dozen')
        expect(m.quantity).to eq 3.375
        expect(m.unit).to eq Measurement::Unit[:dozen]

        m = subject.parse('3 ⅜ dozen')
        expect(m.quantity).to eq 3.375
        expect(m.unit).to eq Measurement::Unit[:dozen]

        m = subject.parse('3⅜doz')
        expect(m.quantity).to eq 3.375
        expect(m.unit).to eq Measurement::Unit[:dozen]
      end

      it 'parses decimals' do
        m = subject.parse('2.1')
        expect(m.quantity).to eq 2.1
        expect(m.unit).to eq Measurement::Unit[:count]

        m = subject.parse('2.1 dozen')
        expect(m.quantity).to eq 2.1
        expect(m.unit).to eq Measurement::Unit[:dozen]

        m = subject.parse('2.1doz')
        expect(m.quantity).to eq 2.1
        expect(m.unit).to eq Measurement::Unit[:dozen]
      end
    end

    describe 'unit' do
      it 'converts when defined' do
        expect(subject.parse('3 dozen').unit).to eq Measurement::Unit[:dozen]
      end

      it 'raises exception when undefined' do
        expect { subject.parse('3 finklebaums') }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.define' do
    it 'delegates to Unit.define' do
      expect(Measurement::Unit).to receive(:define)
      subject.define(:something)
    end
  end

  describe '#convert_to' do
    let(:measurement) { subject.new(3) }

    it 'returns copy of self when target unit matches current unit' do
      result = measurement.convert_to(:count)
      expect(result).to_not be measurement
      expect(result).to eq measurement
    end

    it 'returns target unit if it exists and is convertable' do
      result = measurement.convert_to(:dozen)
      expect(result.quantity).to eq 0.25
      expect(result.unit).to eq Measurement::Unit[:dozen]
    end

    it 'raises exception if unit exists and is not convertable' do
      expect { measurement.convert_to(:inches) }.to raise_error(ArgumentError)
    end

    it 'raises exception if unit does not exist' do
      expect { measurement.convert_to(:finklebaum) }.to raise_error(ArgumentError)
    end
  end

  describe '#convert_to!' do
    let(:measurement) { subject.new(3) }

    it 'modifies the object' do
      measurement.convert_to!(:dozen)
      expect(measurement.quantity).to eq 0.25
      expect(measurement.unit).to eq Measurement::Unit[:dozen]
    end
  end

  describe '#+' do
    let(:measurement) { subject.new(3) }

    it 'adds numeric values' do
      result = measurement + 4
      expect(result.quantity).to eq 7
      expect(result.unit).to eq measurement.unit
    end

    it 'adds units of the same type' do
      other = subject.new(4)
      expect(other.unit).to eq measurement.unit

      result = measurement + other
      expect(result.quantity).to eq 7
      expect(result.unit).to eq measurement.unit
    end

    it 'adds units of a convertable type' do
      other = subject.new(2, :dozen)
      expect(other.unit).to_not eq measurement.unit

      result = measurement + other
      expect(result.quantity).to eq 27
      expect(result.unit).to eq measurement.unit
    end

    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      expect(other.unit).to_not eq measurement.unit
      expect { measurement + other }.to raise_error(ArgumentError)
    end
  end

  describe '#-' do
    let(:measurement) { subject.new(3) }

    it 'subtracts numeric values' do
      result = measurement - 4
      expect(result.quantity).to eq(-1)
      expect(result.unit).to eq measurement.unit
    end

    it 'subtracts units of the same type' do
      other = subject.new(4)
      expect(other.unit).to eq measurement.unit

      result = measurement - other
      expect(result.quantity).to eq(-1)
      expect(result.unit).to eq measurement.unit
    end

    it 'subtracts units of a convertable type' do
      other = subject.new(2, :dozen)
      expect(other.unit).to_not eq measurement.unit

      result = measurement - other
      expect(result.quantity).to eq(-21)
      expect(result.unit).to eq measurement.unit
    end

    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      expect(other.unit).to_not eq measurement.unit
      expect { measurement - other }.to raise_error(ArgumentError)
    end
  end

  describe '#*' do
    let(:measurement) { subject.new(3) }

    it 'multiplies numeric values' do
      result = measurement * 4
      expect(result.quantity).to eq 12
      expect(result.unit).to eq measurement.unit
    end

    it 'multiplies units of the same type' do
      other = subject.new(4)
      expect(other.unit).to eq measurement.unit

      result = measurement * other
      expect(result.quantity).to eq 12
      expect(result.unit).to eq measurement.unit
    end

    it 'multiplies units of a convertable type' do
      other = subject.new(2, :dozen)
      expect(other.unit).to_not eq measurement.unit

      result = measurement * other
      expect(result.quantity).to eq 72
      expect(result.unit).to eq measurement.unit
    end

    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      expect(other.unit).to_not eq measurement.unit
      expect { measurement * other }.to raise_error(ArgumentError)
    end
  end

  describe '#/' do
    let(:measurement) { subject.new(12) }

    it 'divides numeric values' do
      result = measurement / 4
      expect(result.quantity).to eq 3
      expect(result.unit).to eq measurement.unit
    end

    it 'divides units of the same type' do
      other = subject.new(4)
      expect(other.unit).to eq measurement.unit

      result = measurement / other
      expect(result.quantity).to eq 3
      expect(result.unit).to eq measurement.unit
    end

    it 'divides units of a convertable type' do
      other = subject.new(1, :dozen)
      expect(other.unit).to_not eq measurement.unit

      result = measurement / other
      expect(result.quantity).to eq 1
      expect(result.unit).to eq measurement.unit
    end

    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      expect(other.unit).to_not eq measurement.unit
      expect { measurement / other }.to raise_error(ArgumentError)
    end
  end

  describe '#**' do
    let(:measurement) { subject.new(3) }

    it 'raises to the power of numeric values' do
      expect((measurement ** 3).quantity).to eq 27
    end

    it 'raises exception for non-numeric values' do
      expect { measurement ** subject.new(3) }.to raise_error(ArgumentError)
    end
  end

  describe '#==' do
    let(:measurement) { subject.new(3) }

    it 'returns true for measurements with same quantity and unit' do
      expect(measurement == subject.new(3)).to be true
    end

    it 'returns false for measurements with same quantity and different unit' do
      expect(measurement == subject.new(3, :dozen)).to be false
    end

    it 'returns false for measurements with same unit and different quantity' do
      expect(measurement == subject.new(4)).to be false
    end

    it 'returns false for non-measurement objects' do
      expect(measurement == 3).to be false
    end
  end

  describe '#to_s' do
    it 'returns the quantity and unit' do
      expect(subject.new(3.5).to_s).to eq '3.5 count'
      expect(subject.new(2, :dozen).to_s).to eq '2 doz'
    end
  end

  describe '#inspect' do
    it 'returns the quantity and unit' do
      expect(subject.new(3.5).inspect).to eq '3.5 count'
      expect(subject.new(2, :dozen).inspect).to eq '2 doz'
    end
  end
end
