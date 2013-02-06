# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'acre-feet' do
    subject { Measurement.parse('1 acre ft') }
    
    it 'converts to cubic yards' do
      subject.convert_to(:yd3).quantity.should eq Rational(4840, 3).to_f
    end
    
    it 'converts to cubic feet' do
      subject.convert_to(:ft3).quantity.should eq 43_560
    end
    
    it 'converts to cubic inches' do
      subject.convert_to(:in3).quantity.should eq 75_271_680
    end
  end
  
  describe 'cubic yards' do
    subject { Measurement.parse('1613 1/3 yd³') }
    
    it 'converts to acre-feet' do
      subject.convert_to(:'acre ft').quantity.should eq 1
    end
    
    it 'converts to cubic feet' do
      subject.convert_to(:ft3).quantity.should eq 43_560
    end
    
    it 'converts to cubic inches' do
      subject.convert_to(:in3).quantity.should eq 75_271_680
    end
  end
  
  describe 'cubic feet' do
    subject { Measurement.parse('43560 ft³') }
    
    it 'converts to acre-feet' do
      subject.convert_to(:'acre ft').quantity.should eq 1
    end
    
    it 'converts to cubic yards' do
      subject.convert_to(:yd3).quantity.should eq Rational(4840, 3).to_f
    end
    
    it 'converts to cubic inches' do
      subject.convert_to(:in3).quantity.should eq 75_271_680
    end
  end
  
  describe 'cubic inches' do
    subject { Measurement.parse('75271680 in³') }
    
    it 'converts to acre-feet' do
      subject.convert_to(:'acre ft').quantity.should eq 1
    end
    
    it 'converts to cubic yards' do
      subject.convert_to(:yd3).quantity.should eq Rational(4840, 3).to_f
    end
    
    it 'converts to cubic feet' do
      subject.convert_to(:ft3).quantity.should eq 43_560
    end
  end
end
