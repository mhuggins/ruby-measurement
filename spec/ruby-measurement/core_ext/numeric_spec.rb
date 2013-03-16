require 'spec_helper'

describe Numeric do
  describe '#to_measurement' do
    subject { 20 }
    specify { subject.to_measurement.should eq Measurement.new(20) }
  end
end
