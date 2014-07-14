# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'square miles' do
    subject { described_class.parse('1 mi²') }
    
    it 'converts to square furlongs' do
      expect(subject.convert_to(:fur2).quantity).to eq 64
    end
    
    it 'converts to square chains' do
      expect(subject.convert_to(:ch2).quantity).to eq 6_400
    end
    
    it 'converts to square yards' do
      expect(subject.convert_to(:yd2).quantity).to eq 3_097_600
    end
    
    it 'converts to square feet' do
      expect(subject.convert_to(:ft2).quantity).to eq 27_878_400
    end
    
    it 'converts to square inches' do
      expect(subject.convert_to(:in2).quantity).to eq 4_014_489_600
    end
  end
  
  describe 'square furlongs' do
    subject { described_class.parse('64 fur²') }
    
    it 'converts to square miles' do
      expect(subject.convert_to(:mi2).quantity).to eq 1
    end
    
    it 'converts to square chains' do
      expect(subject.convert_to(:ch2).quantity).to eq 6_400
    end
    
    it 'converts to square yards' do
      expect(subject.convert_to(:yd2).quantity).to eq 3_097_600
    end
    
    it 'converts to square feet' do
      expect(subject.convert_to(:ft2).quantity).to eq 27_878_400
    end
    
    it 'converts to square inches' do
      expect(subject.convert_to(:in2).quantity).to eq 4_014_489_600
    end
  end
  
  describe 'square chains' do
    subject { described_class.parse('6400 ch²') }
    
    it 'converts to square miles' do
      expect(subject.convert_to(:mi2).quantity).to eq 1
    end
    
    it 'converts to square furlongs' do
      expect(subject.convert_to(:fur2).quantity).to eq 64
    end
    
    it 'converts to square yards' do
      expect(subject.convert_to(:yd2).quantity).to eq 3_097_600
    end
    
    it 'converts to square feet' do
      expect(subject.convert_to(:ft2).quantity).to eq 27_878_400
    end
    
    it 'converts to square inches' do
      expect(subject.convert_to(:in2).quantity).to eq 4_014_489_600
    end
  end
  
  describe 'square yards' do
    subject { described_class.parse('3097600 yd²') }
    
    it 'converts to square miles' do
      expect(subject.convert_to(:mi2).quantity).to eq 1
    end
    
    it 'converts to square furlongs' do
      expect(subject.convert_to(:fur2).quantity).to eq 64
    end
    
    it 'converts to square chains' do
      expect(subject.convert_to(:ch2).quantity).to eq 6_400
    end
    
    it 'converts to square feet' do
      expect(subject.convert_to(:ft2).quantity).to eq 27_878_400
    end
    
    it 'converts to square inches' do
      expect(subject.convert_to(:in2).quantity).to eq 4_014_489_600
    end
  end
  
  describe 'square feet' do
    subject { described_class.parse('27878400 ft²') }
    
    it 'converts to square miles' do
      expect(subject.convert_to(:mi2).quantity).to eq 1
    end
    
    it 'converts to square furlongs' do
      expect(subject.convert_to(:fur2).quantity).to eq 64
    end
    
    it 'converts to square chains' do
      expect(subject.convert_to(:ch2).quantity).to eq 6_400
    end
    
    it 'converts to square yards' do
      expect(subject.convert_to(:yd2).quantity).to eq 3_097_600
    end
    
    it 'converts to square inches' do
      expect(subject.convert_to(:in2).quantity).to eq 4_014_489_600
    end
  end
  
  describe 'square inches' do
    subject { described_class.parse('4014489600 in²') }
    
    it 'converts to square miles' do
      expect(subject.convert_to(:mi2).quantity).to eq 1
    end
    
    it 'converts to square furlongs' do
      expect(subject.convert_to(:fur2).quantity).to eq 64
    end
    
    it 'converts to square chains' do
      expect(subject.convert_to(:ch2).quantity).to eq 6_400
    end
    
    it 'converts to square yards' do
      expect(subject.convert_to(:yd2).quantity).to eq 3_097_600
    end
    
    it 'converts to square feet' do
      expect(subject.convert_to(:ft2).quantity).to eq 27_878_400
    end
  end
end
