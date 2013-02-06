# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'miles' do
    subject { Measurement.parse('1 mi') }
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'furlongs' do
    subject { Measurement.parse('8 fur') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'chains' do
    subject { Measurement.parse('80 ch') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'fathoms' do
    subject { Measurement.parse('880 ftm') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'yards' do
    subject { Measurement.parse('1760 yd') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'feet' do
    subject { Measurement.parse('5280 ft') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'inches' do
    subject { Measurement.parse('63360 in') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to thou' do
      subject.convert_to(:th).quantity.should eq 63_360_000
    end
  end
  
  describe 'thou' do
    subject { Measurement.parse('63360000 th') }
    
    it 'converts to miles' do
      subject.convert_to(:mi).quantity.should eq 1
    end
    
    it 'converts to furlongs' do
      subject.convert_to(:fur).quantity.should eq 8
    end
    
    it 'converts to chains' do
      subject.convert_to(:ch).quantity.should eq 80
    end
    
    it 'converts to fathoms' do
      subject.convert_to(:ftm).quantity.should eq 880
    end
    
    it 'converts to yards' do
      subject.convert_to(:yd).quantity.should eq 1_760
    end
    
    it 'converts to feet' do
      subject.convert_to(:ft).quantity.should eq 5_280
    end
    
    it 'converts to inches' do
      subject.convert_to(:in).quantity.should eq 63_360
    end
  end
end
