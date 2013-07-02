require 'spec_helper'

describe Measurement do
  subject { Measurement }
  
  describe '.new' do
    describe 'with valid quantity' do
      it 'sets the quantity' do
        subject.new(3).quantity.should eq 3
      end
      
      it 'sets the default unit' do
        subject.new(3).unit.should eq subject::Unit[:count]
      end
    end
    
    describe 'with valid quantity and unit name' do
      it 'sets the quantity' do
        subject.new(2, :dozen).quantity.should eq 2
      end
      
      it 'sets the unit' do
        subject.new(2, :dozen).unit.should eq subject::Unit[:dozen]
      end
    end
    
    describe 'with valid quantity and unit' do
      it 'sets the quantity' do
        subject.new(2, subject::Unit[:dozen]).quantity.should eq 2
      end
      
      it 'sets the unit' do
        subject.new(2, subject::Unit[:dozen]).unit.should eq subject::Unit[:dozen]
      end
    end
    
    describe 'with invalid quantity' do
      it 'raises exception' do
        expect { subject.new('hi') }.to raise_exception
      end
    end
    
    describe 'with invalid unit' do
      it 'raises exception' do
        expect { subject.new(3, :finklebaum) }.to raise_exception
      end
    end
  end
  
  describe '.parse' do
    describe 'quantity' do
      it 'parses scientific notation' do
        m = subject.parse('4.3e12')
        m.quantity.should eq 4.3e12
        m.unit.should eq subject::Unit[:count]
        
        m = subject.parse('4.3e12 dozen')
        m.quantity.should eq 4.3e12
        m.unit.should eq subject::Unit[:dozen]
        
        m = subject.parse('4.3e12doz')
        m.quantity.should eq 4.3e12
        m.unit.should eq subject::Unit[:dozen]
      end
      
      it 'parses fractions' do
        m = subject.parse('1/4')
        m.quantity.should eq 0.25
        m.unit.should eq subject::Unit[:count]
        
        m = subject.parse('1/4 dozen')
        m.quantity.should eq 0.25
        m.unit.should eq subject::Unit[:dozen]
        
        m = subject.parse('1/4doz')
        m.quantity.should eq 0.25
        m.unit.should eq subject::Unit[:dozen]
      end
      
      it 'parses mixed fractions' do
        m = subject.parse('3 2/5')
        m.quantity.should eq 3.4
        m.unit.should eq subject::Unit[:count]
        
        m = subject.parse('3 2/5 dozen')
        m.quantity.should eq 3.4
        m.unit.should eq subject::Unit[:dozen]
        
        m = subject.parse('3 2/5')
        m.quantity.should eq 3.4
        m.unit.should eq subject::Unit[:count]
      end
      
      it 'parses decimals' do
        m = subject.parse('2.1')
        m.quantity.should eq 2.1
        m.unit.should eq subject::Unit[:count]
        
        m = subject.parse('2.1 dozen')
        m.quantity.should eq 2.1
        m.unit.should eq subject::Unit[:dozen]
        
        m = subject.parse('2.1doz')
        m.quantity.should eq 2.1
        m.unit.should eq subject::Unit[:dozen]
      end
    end
    
    describe 'unit' do
      it 'converts when defined' do
        subject.parse('3 dozen').unit.should eq subject::Unit[:dozen]
      end
      
      it 'raises exception when undefined' do
        expect { subject.parse('3 finklebaums') }.to raise_error
      end
    end
  end
  
  describe '.define' do
    it 'delegates to Unit.define' do
      subject::Unit.should_receive(:define)
      subject.define(:something)
    end
  end
  
  describe '.all' do
    it 'return all defined Unit' do
      unit_defined = subject.all
      unit_defined.should be_kind_of(Array)
      unit_defined.should include("count")
    end
  end
  
  describe '#convert_to' do
    let(:measurement) { subject.new(3) }
    
    it 'returns copy of self when target unit matches current unit' do
      result = measurement.convert_to(:count)
      result.should_not be measurement
      result.should eq measurement
    end
    
    it 'returns target unit if it exists and is convertable' do
      result = measurement.convert_to(:dozen)
      result.quantity.should eq 0.25
      result.unit.should eq subject::Unit[:dozen]
    end
    
    it 'raises exception if unit exists and is not convertable' do
      expect { measurement.convert_to(:inches) }.to raise_error
    end
    
    it 'raises exception if unit does not exist' do
      expect { measurement.convert_to(:finklebaum) }.to raise_error
    end
  end
  
  describe '#convert_to!' do
    let(:measurement) { subject.new(3) }
    
    it 'modifies the object' do
      measurement.convert_to!(:dozen)
      measurement.quantity.should eq 0.25
      measurement.unit.should eq subject::Unit[:dozen]
    end
  end
  
  describe '#+' do
    let(:measurement) { subject.new(3) }
    
    it 'adds numeric values' do
      result = measurement + 4
      result.quantity.should eq 7
      result.unit.should eq measurement.unit
    end
    
    it 'adds units of the same type' do
      other = subject.new(4)
      other.unit.should eq measurement.unit
      
      result = measurement + other
      result.quantity.should eq 7
      result.unit.should eq measurement.unit
    end
    
    it 'adds units of a convertable type' do
      other = subject.new(2, :dozen)
      other.unit.should_not eq measurement.unit
      
      result = measurement + other
      result.quantity.should eq 27
      result.unit.should eq measurement.unit
    end
    
    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      other.unit.should_not eq measurement.unit
      expect { measurement + other }.to raise_error
    end
  end
  
  describe '#-' do
    let(:measurement) { subject.new(3) }
    
    it 'subtracts numeric values' do
      result = measurement - 4
      result.quantity.should eq -1
      result.unit.should eq measurement.unit
    end
    
    it 'subtracts units of the same type' do
      other = subject.new(4)
      other.unit.should eq measurement.unit
      
      result = measurement - other
      result.quantity.should eq -1
      result.unit.should eq measurement.unit
    end
    
    it 'subtracts units of a convertable type' do
      other = subject.new(2, :dozen)
      other.unit.should_not eq measurement.unit
      
      result = measurement - other
      result.quantity.should eq -21
      result.unit.should eq measurement.unit
    end
    
    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      other.unit.should_not eq measurement.unit
      expect { measurement - other }.to raise_error
    end
  end
  
  describe '#*' do
    let(:measurement) { subject.new(3) }
    
    it 'multiplies numeric values' do
      result = measurement * 4
      result.quantity.should eq 12
      result.unit.should eq measurement.unit
    end
    
    it 'multiplies units of the same type' do
      other = subject.new(4)
      other.unit.should eq measurement.unit
      
      result = measurement * other
      result.quantity.should eq 12
      result.unit.should eq measurement.unit
    end
    
    it 'multiplies units of a convertable type' do
      other = subject.new(2, :dozen)
      other.unit.should_not eq measurement.unit
      
      result = measurement * other
      result.quantity.should eq 72
      result.unit.should eq measurement.unit
    end
    
    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      other.unit.should_not eq measurement.unit
      expect { measurement * other }.to raise_error
    end
  end
  
  describe '#/' do
    let(:measurement) { subject.new(12) }
    
    it 'divides numeric values' do
      result = measurement / 4
      result.quantity.should eq 3
      result.unit.should eq measurement.unit
    end
    
    it 'divides units of the same type' do
      other = subject.new(4)
      other.unit.should eq measurement.unit
      
      result = measurement / other
      result.quantity.should eq 3
      result.unit.should eq measurement.unit
    end
    
    it 'divides units of a convertable type' do
      other = subject.new(1, :dozen)
      other.unit.should_not eq measurement.unit
      
      result = measurement / other
      result.quantity.should eq 1
      result.unit.should eq measurement.unit
    end
    
    it 'raises exception for incompatible units' do
      other = subject.new(4, :inches)
      other.unit.should_not eq measurement.unit
      expect { measurement / other }.to raise_error
    end
  end
  
  describe '#**' do
    let(:measurement) { subject.new(3) }
    
    it 'raises to the power of numeric values' do
      (measurement ** 3).quantity.should eq 27
    end
    
    it 'raises exception for non-numeric values' do
      expect { measurement ** subject.new(3) }.to raise_error
    end
  end
  
  describe '#==' do
    let(:measurement) { subject.new(3) }
    
    it 'returns true for measurements with same quantity and unit' do
      (measurement == subject.new(3)).should be_true
    end
    
    it 'returns false for measurements with same quantity and different unit' do
      (measurement == subject.new(3, :dozen)).should be_false
    end
    
    it 'returns false for measurements with same unit and different quantity' do
      (measurement == subject.new(4)).should be_false
    end
    
    it 'returns false for non-measurement objects' do
      (measurement == 3).should be_false
    end
  end
  
  describe '#to_s' do
    it 'returns the quantity and unit' do
      subject.new(3.5).to_s.should eq '3.5 count'
      subject.new(2, :dozen).to_s.should eq '2 doz'
    end
  end
  
  describe '#inspect' do
    it 'returns the quantity and unit' do
      subject.new(3.5).inspect.should eq '3.5 count'
      subject.new(2, :dozen).inspect.should eq '2 doz'
    end
  end
end
