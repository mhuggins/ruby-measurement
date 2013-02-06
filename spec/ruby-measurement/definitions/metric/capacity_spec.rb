# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'cubic meters' do
    subject { Measurement.parse('1 m³') }
    
    it 'converts to cubic decimeters' do
      subject.convert_to(:dm3).quantity.should eq 1_000
    end
    
    it 'converts to cubic centimeters' do
      subject.convert_to(:cm3).quantity.should eq 1_000_000
    end
  end
  
  describe 'cubic decimeters' do
    subject { Measurement.parse('1000 dm³') }
    
    it 'converts to cubic meters' do
      subject.convert_to(:m3).quantity.should eq 1
    end
    
    it 'converts to cubic centimeters' do
      subject.convert_to(:cm3).quantity.should eq 1_000_000
    end
  end
  
  describe 'cubic centimeters' do
    subject { Measurement.parse('1000000 cm³') }
    
    it 'converts to cubic meters' do
      subject.convert_to(:m3).quantity.should eq 1
    end
    
    it 'converts to cubic decimeters' do
      subject.convert_to(:dm3).quantity.should eq 1_000
    end
  end
end
