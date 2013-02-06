# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'square miles' do
    subject { Measurement.parse('1 mi²') }
    
    it 'converts to square furlongs' do
      subject.convert_to(:fur2).quantity.should eq 64
    end
    
    it 'converts to square chains' do
      subject.convert_to(:ch2).quantity.should eq 6_400
    end
    
    it 'converts to square yards' do
      subject.convert_to(:yd2).quantity.should eq 3_097_600
    end
    
    it 'converts to square feet' do
      subject.convert_to(:ft2).quantity.should eq 27_878_400
    end
    
    it 'converts to square inches' do
      subject.convert_to(:in2).quantity.should eq 4_014_489_600
    end
  end
  
  describe 'square furlongs' do
    subject { Measurement.parse('64 fur²') }
    
    it 'converts to square miles' do
      subject.convert_to(:mi2).quantity.should eq 1
    end
    
    it 'converts to square chains' do
      subject.convert_to(:ch2).quantity.should eq 6_400
    end
    
    it 'converts to square yards' do
      subject.convert_to(:yd2).quantity.should eq 3_097_600
    end
    
    it 'converts to square feet' do
      subject.convert_to(:ft2).quantity.should eq 27_878_400
    end
    
    it 'converts to square inches' do
      subject.convert_to(:in2).quantity.should eq 4_014_489_600
    end
  end
  
  describe 'square chains' do
    subject { Measurement.parse('6400 ch²') }
    
    it 'converts to square miles' do
      subject.convert_to(:mi2).quantity.should eq 1
    end
    
    it 'converts to square furlongs' do
      subject.convert_to(:fur2).quantity.should eq 64
    end
    
    it 'converts to square yards' do
      subject.convert_to(:yd2).quantity.should eq 3_097_600
    end
    
    it 'converts to square feet' do
      subject.convert_to(:ft2).quantity.should eq 27_878_400
    end
    
    it 'converts to square inches' do
      subject.convert_to(:in2).quantity.should eq 4_014_489_600
    end
  end
  
  describe 'square yards' do
    subject { Measurement.parse('3097600 yd²') }
    
    it 'converts to square miles' do
      subject.convert_to(:mi2).quantity.should eq 1
    end
    
    it 'converts to square furlongs' do
      subject.convert_to(:fur2).quantity.should eq 64
    end
    
    it 'converts to square chains' do
      subject.convert_to(:ch2).quantity.should eq 6_400
    end
    
    it 'converts to square feet' do
      subject.convert_to(:ft2).quantity.should eq 27_878_400
    end
    
    it 'converts to square inches' do
      subject.convert_to(:in2).quantity.should eq 4_014_489_600
    end
  end
  
  describe 'square feet' do
    subject { Measurement.parse('27878400 ft²') }
    
    it 'converts to square miles' do
      subject.convert_to(:mi2).quantity.should eq 1
    end
    
    it 'converts to square furlongs' do
      subject.convert_to(:fur2).quantity.should eq 64
    end
    
    it 'converts to square chains' do
      subject.convert_to(:ch2).quantity.should eq 6_400
    end
    
    it 'converts to square yards' do
      subject.convert_to(:yd2).quantity.should eq 3_097_600
    end
    
    it 'converts to square inches' do
      subject.convert_to(:in2).quantity.should eq 4_014_489_600
    end
  end
  
  describe 'square inches' do
    subject { Measurement.parse('4014489600 in²') }
    
    it 'converts to square miles' do
      subject.convert_to(:mi2).quantity.should eq 1
    end
    
    it 'converts to square furlongs' do
      subject.convert_to(:fur2).quantity.should eq 64
    end
    
    it 'converts to square chains' do
      subject.convert_to(:ch2).quantity.should eq 6_400
    end
    
    it 'converts to square yards' do
      subject.convert_to(:yd2).quantity.should eq 3_097_600
    end
    
    it 'converts to square feet' do
      subject.convert_to(:ft2).quantity.should eq 27_878_400
    end
  end
end
