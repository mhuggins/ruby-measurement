# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'gallons' do
    subject { Measurement.parse('1 gal') }
    
    it 'converts to quarts' do
      subject.convert_to(:qt).quantity.should eq 4
    end
    
    it 'converts to pints' do
      subject.convert_to(:pt).quantity.should eq 8
    end
    
    it 'converts to cups' do
      subject.convert_to(:c).quantity.should eq 16
    end
    
    it 'converts to fluid ounces' do
      subject.convert_to(:'fl oz').quantity.should eq 128
    end
    
    it 'converts to tablespoons' do
      subject.convert_to(:tbsp).quantity.should eq 256
    end
    
    it 'converts to teaspoons' do
      subject.convert_to(:tsp).quantity.should eq 768
    end
  end
  
  describe 'quarts' do
    subject { Measurement.parse('4 qt') }
    
    it 'converts to gallons' do
      subject.convert_to(:gal).quantity.should eq 1
    end
    
    it 'converts to pints' do
      subject.convert_to(:pt).quantity.should eq 8
    end
    
    it 'converts to cups' do
      subject.convert_to(:c).quantity.should eq 16
    end
    
    it 'converts to fluid ounces' do
      subject.convert_to(:'fl oz').quantity.should eq 128
    end
    
    it 'converts to tablespoons' do
      subject.convert_to(:tbsp).quantity.should eq 256
    end
    
    it 'converts to teaspoons' do
      subject.convert_to(:tsp).quantity.should eq 768
    end
  end
  
  describe 'pints' do
    subject { Measurement.parse('8 pt') }
    
    it 'converts to gallons' do
      subject.convert_to(:gal).quantity.should eq 1
    end
    
    it 'converts to quarts' do
      subject.convert_to(:qt).quantity.should eq 4
    end
    
    it 'converts to cups' do
      subject.convert_to(:c).quantity.should eq 16
    end
    
    it 'converts to fluid ounces' do
      subject.convert_to(:'fl oz').quantity.should eq 128
    end
    
    it 'converts to tablespoons' do
      subject.convert_to(:tbsp).quantity.should eq 256
    end
    
    it 'converts to teaspoons' do
      subject.convert_to(:tsp).quantity.should eq 768
    end
  end
  
  describe 'cups' do
    subject { Measurement.parse('16 c') }
    
    it 'converts to gallons' do
      subject.convert_to(:gal).quantity.should eq 1
    end
    
    it 'converts to quarts' do
      subject.convert_to(:qt).quantity.should eq 4
    end
    
    it 'converts to pints' do
      subject.convert_to(:pt).quantity.should eq 8
    end
    
    it 'converts to fluid ounces' do
      subject.convert_to(:'fl oz').quantity.should eq 128
    end
    
    it 'converts to tablespoons' do
      subject.convert_to(:tbsp).quantity.should eq 256
    end
    
    it 'converts to teaspoons' do
      subject.convert_to(:tsp).quantity.should eq 768
    end
  end
  
  describe 'fluid ounces' do
    subject { Measurement.parse('128 fl oz') }
    
    it 'converts to gallons' do
      subject.convert_to(:gal).quantity.should eq 1
    end
    
    it 'converts to quarts' do
      subject.convert_to(:qt).quantity.should eq 4
    end
    
    it 'converts to pints' do
      subject.convert_to(:pt).quantity.should eq 8
    end
    
    it 'converts to cups' do
      subject.convert_to(:c).quantity.should eq 16
    end
    
    it 'converts to tablespoons' do
      subject.convert_to(:tbsp).quantity.should eq 256
    end
    
    it 'converts to teaspoons' do
      subject.convert_to(:tsp).quantity.should eq 768
    end
  end
  
  describe 'tablespoons' do
    subject { Measurement.parse('256 tbsp') }
    
    it 'converts to gallons' do
      subject.convert_to(:gal).quantity.should eq 1
    end
    
    it 'converts to quarts' do
      subject.convert_to(:qt).quantity.should eq 4
    end
    
    it 'converts to pints' do
      subject.convert_to(:pt).quantity.should eq 8
    end
    
    it 'converts to cups' do
      subject.convert_to(:c).quantity.should eq 16
    end
    
    it 'converts to fluid ounces' do
      subject.convert_to(:'fl oz').quantity.should eq 128
    end
    
    it 'converts to teaspoons' do
      subject.convert_to(:tsp).quantity.should eq 768
    end
  end
  
  describe 'teaspoons' do
    subject { Measurement.parse('768 tsp') }
    
    it 'converts to gallons' do
      subject.convert_to(:gal).quantity.should eq 1
    end
    
    it 'converts to quarts' do
      subject.convert_to(:qt).quantity.should eq 4
    end
    
    it 'converts to pints' do
      subject.convert_to(:pt).quantity.should eq 8
    end
    
    it 'converts to cups' do
      subject.convert_to(:c).quantity.should eq 16
    end
    
    it 'converts to fluid ounces' do
      subject.convert_to(:'fl oz').quantity.should eq 128
    end
    
    it 'converts to tablespoons' do
      subject.convert_to(:tbsp).quantity.should eq 256
    end
  end
end
