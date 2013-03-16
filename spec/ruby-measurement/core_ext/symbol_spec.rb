require 'spec_helper'

describe Symbol do
  describe '#to_unit' do
    describe 'with valid unit' do
      subject { :dozen }
      specify { subject.to_unit.should eq Measurement::Unit[:dozen] }
    end

    describe 'with invalid unit' do
      subject { :person }
      specify { expect { subject.to_unit }.to raise_error }
    end
  end
end
