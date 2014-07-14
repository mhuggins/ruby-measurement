# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'kiloliters' do
    subject { described_class.parse('1 kl') }
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'hectoliters' do
    subject { described_class.parse('10 hl') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'dekaliters' do
    subject { described_class.parse('100 dal') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'liters' do
    subject { described_class.parse('1000 l') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'deciliters' do
    subject { described_class.parse('10000 dl') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'centiliters' do
    subject { described_class.parse('100000 cl') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'milliliters' do
    subject { described_class.parse('1000000 ml') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to microliters' do
      expect(subject.convert_to(:µl).quantity).to eq 10_000_000
    end
  end
  
  describe 'microliters' do
    subject { described_class.parse('10000000 µl') }
    
    it 'converts to kiloliters' do
      expect(subject.convert_to(:kl).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hl).quantity).to eq 10
    end
    
    it 'converts to dekaliters' do
      expect(subject.convert_to(:dal).quantity).to eq 100
    end
    
    it 'converts to liters' do
      expect(subject.convert_to(:l).quantity).to eq 1_000
    end
    
    it 'converts to deciliters' do
      expect(subject.convert_to(:dl).quantity).to eq 10_000
    end
    
    it 'converts to centiliters' do
      expect(subject.convert_to(:cl).quantity).to eq 100_000
    end
    
    it 'converts to milliliters' do
      expect(subject.convert_to(:ml).quantity).to eq 1_000_000
    end
  end
end
