# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'kiloliters' do
    subject { Measurement.parse('1 kl') }
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'hectoliters' do
    subject { Measurement.parse('10 hl') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'dekaliters' do
    subject { Measurement.parse('100 dal') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'liters' do
    subject { Measurement.parse('1000 l') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'deciliters' do
    subject { Measurement.parse('10000 dl') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'centiliters' do
    subject { Measurement.parse('100000 cl') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'milliliters' do
    subject { Measurement.parse('1000000 ml') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to microliters' do
      subject.convert_to(:µl).quantity.should eq 10_000_000
    end
  end
  
  describe 'microliters' do
    subject { Measurement.parse('10000000 µl') }
    
    it 'converts to kiloliters' do
      subject.convert_to(:kl).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hl).quantity.should eq 10
    end
    
    it 'converts to dekaliters' do
      subject.convert_to(:dal).quantity.should eq 100
    end
    
    it 'converts to liters' do
      subject.convert_to(:l).quantity.should eq 1_000
    end
    
    it 'converts to deciliters' do
      subject.convert_to(:dl).quantity.should eq 10_000
    end
    
    it 'converts to centiliters' do
      subject.convert_to(:cl).quantity.should eq 100_000
    end
    
    it 'converts to milliliters' do
      subject.convert_to(:ml).quantity.should eq 1_000_000
    end
  end
end
