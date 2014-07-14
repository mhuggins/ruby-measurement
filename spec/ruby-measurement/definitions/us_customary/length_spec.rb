# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'miles' do
    subject { described_class.parse('1 mi') }
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'furlongs' do
    subject { described_class.parse('8 fur') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'chains' do
    subject { described_class.parse('80 ch') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'fathoms' do
    subject { described_class.parse('880 ftm') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'yards' do
    subject { described_class.parse('1760 yd') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'feet' do
    subject { described_class.parse('5280 ft') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'inches' do
    subject { described_class.parse('63360 in') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to thou' do
      expect(subject.convert_to(:th).quantity).to eq 63_360_000
    end
  end
  
  describe 'thou' do
    subject { described_class.parse('63360000 th') }
    
    it 'converts to miles' do
      expect(subject.convert_to(:mi).quantity).to eq 1
    end
    
    it 'converts to furlongs' do
      expect(subject.convert_to(:fur).quantity).to eq 8
    end
    
    it 'converts to chains' do
      expect(subject.convert_to(:ch).quantity).to eq 80
    end
    
    it 'converts to fathoms' do
      expect(subject.convert_to(:ftm).quantity).to eq 880
    end
    
    it 'converts to yards' do
      expect(subject.convert_to(:yd).quantity).to eq 1_760
    end
    
    it 'converts to feet' do
      expect(subject.convert_to(:ft).quantity).to eq 5_280
    end
    
    it 'converts to inches' do
      expect(subject.convert_to(:in).quantity).to eq 63_360
    end
  end
end
