require 'spec_helper'

RSpec.describe String do
  describe '#to_measurement' do
    describe 'with valid quantity' do
      subject { '3' }
      specify { expect(subject.to_measurement).to eq Measurement.new(3) }
    end

    describe 'with valid quantity and unit' do
      subject { '3 dozen' }
      specify { expect(subject.to_measurement).to eq Measurement.new(3, :dozen) }
    end

    describe 'with valid quantity and invalid unit' do
      subject { '3 people' }
      specify { expect { subject.to_measurement }.to raise_error(ArgumentError, "Invalid unit: 'people'") }
    end

    describe 'with invalid input' do
      subject { 'foobar' }
      specify { expect { subject.to_measurement }.to raise_error(ArgumentError, "Invalid unit: 'foobar'") }
    end
  end

  describe '#to_unit' do
    describe 'with valid unit' do
      subject { 'dozen' }
      specify { expect(subject.to_unit).to eq Measurement::Unit[:dozen] }
    end

    describe 'with invalid unit' do
      subject { 'person' }
      specify { expect { subject.to_unit }.to raise_error(ArgumentError, "Invalid unit: 'person'") }
    end
  end
end
