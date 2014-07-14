require 'spec_helper'

RSpec.describe Numeric do
  describe '#to_measurement' do
    subject { 20 }
    specify { expect(subject.to_measurement).to eq Measurement.new(20) }
  end
end
