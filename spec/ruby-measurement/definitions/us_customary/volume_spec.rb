# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'gallons' do
    subject { described_class.parse('1 gal') }
    
    it 'converts to quarts' do
      expect(subject.convert_to(:qt).quantity).to eq 4
    end
    
    it 'converts to pints' do
      expect(subject.convert_to(:pt).quantity).to eq 8
    end
    
    it 'converts to cups' do
      expect(subject.convert_to(:c).quantity).to eq 16
    end
    
    it 'converts to fluid ounces' do
      expect(subject.convert_to(:'fl oz').quantity).to eq 128
    end
    
    it 'converts to tablespoons' do
      expect(subject.convert_to(:tbsp).quantity).to eq 256
    end
    
    it 'converts to teaspoons' do
      expect(subject.convert_to(:tsp).quantity).to eq 768
    end
  end
  
  describe 'quarts' do
    subject { described_class.parse('4 qt') }
    
    it 'converts to gallons' do
      expect(subject.convert_to(:gal).quantity).to eq 1
    end
    
    it 'converts to pints' do
      expect(subject.convert_to(:pt).quantity).to eq 8
    end
    
    it 'converts to cups' do
      expect(subject.convert_to(:c).quantity).to eq 16
    end
    
    it 'converts to fluid ounces' do
      expect(subject.convert_to(:'fl oz').quantity).to eq 128
    end
    
    it 'converts to tablespoons' do
      expect(subject.convert_to(:tbsp).quantity).to eq 256
    end
    
    it 'converts to teaspoons' do
      expect(subject.convert_to(:tsp).quantity).to eq 768
    end
  end
  
  describe 'pints' do
    subject { described_class.parse('8 pt') }
    
    it 'converts to gallons' do
      expect(subject.convert_to(:gal).quantity).to eq 1
    end
    
    it 'converts to quarts' do
      expect(subject.convert_to(:qt).quantity).to eq 4
    end
    
    it 'converts to cups' do
      expect(subject.convert_to(:c).quantity).to eq 16
    end
    
    it 'converts to fluid ounces' do
      expect(subject.convert_to(:'fl oz').quantity).to eq 128
    end
    
    it 'converts to tablespoons' do
      expect(subject.convert_to(:tbsp).quantity).to eq 256
    end
    
    it 'converts to teaspoons' do
      expect(subject.convert_to(:tsp).quantity).to eq 768
    end
  end
  
  describe 'cups' do
    subject { described_class.parse('16 c') }
    
    it 'converts to gallons' do
      expect(subject.convert_to(:gal).quantity).to eq 1
    end
    
    it 'converts to quarts' do
      expect(subject.convert_to(:qt).quantity).to eq 4
    end
    
    it 'converts to pints' do
      expect(subject.convert_to(:pt).quantity).to eq 8
    end
    
    it 'converts to fluid ounces' do
      expect(subject.convert_to(:'fl oz').quantity).to eq 128
    end
    
    it 'converts to tablespoons' do
      expect(subject.convert_to(:tbsp).quantity).to eq 256
    end
    
    it 'converts to teaspoons' do
      expect(subject.convert_to(:tsp).quantity).to eq 768
    end
  end
  
  describe 'fluid ounces' do
    subject { described_class.parse('128 fl oz') }
    
    it 'converts to gallons' do
      expect(subject.convert_to(:gal).quantity).to eq 1
    end
    
    it 'converts to quarts' do
      expect(subject.convert_to(:qt).quantity).to eq 4
    end
    
    it 'converts to pints' do
      expect(subject.convert_to(:pt).quantity).to eq 8
    end
    
    it 'converts to cups' do
      expect(subject.convert_to(:c).quantity).to eq 16
    end
    
    it 'converts to tablespoons' do
      expect(subject.convert_to(:tbsp).quantity).to eq 256
    end
    
    it 'converts to teaspoons' do
      expect(subject.convert_to(:tsp).quantity).to eq 768
    end
  end
  
  describe 'tablespoons' do
    subject { described_class.parse('256 tbsp') }
    
    it 'converts to gallons' do
      expect(subject.convert_to(:gal).quantity).to eq 1
    end
    
    it 'converts to quarts' do
      expect(subject.convert_to(:qt).quantity).to eq 4
    end
    
    it 'converts to pints' do
      expect(subject.convert_to(:pt).quantity).to eq 8
    end
    
    it 'converts to cups' do
      expect(subject.convert_to(:c).quantity).to eq 16
    end
    
    it 'converts to fluid ounces' do
      expect(subject.convert_to(:'fl oz').quantity).to eq 128
    end
    
    it 'converts to teaspoons' do
      expect(subject.convert_to(:tsp).quantity).to eq 768
    end
  end
  
  describe 'teaspoons' do
    subject { described_class.parse('768 tsp') }
    
    it 'converts to gallons' do
      expect(subject.convert_to(:gal).quantity).to eq 1
    end
    
    it 'converts to quarts' do
      expect(subject.convert_to(:qt).quantity).to eq 4
    end
    
    it 'converts to pints' do
      expect(subject.convert_to(:pt).quantity).to eq 8
    end
    
    it 'converts to cups' do
      expect(subject.convert_to(:c).quantity).to eq 16
    end
    
    it 'converts to fluid ounces' do
      expect(subject.convert_to(:'fl oz').quantity).to eq 128
    end
    
    it 'converts to tablespoons' do
      expect(subject.convert_to(:tbsp).quantity).to eq 256
    end
  end
end
