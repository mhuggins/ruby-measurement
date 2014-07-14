# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'tons' do
    subject { described_class.parse('1 ton') }
    
    it 'converts to hundredweights' do
      expect(subject.convert_to(:cwt).quantity).to eq 20
    end
    
    it 'converts to pounds' do
      expect(subject.convert_to(:lbs).quantity).to eq 2_000
    end
    
    it 'converts to ounces' do
      expect(subject.convert_to(:oz).quantity).to eq 32_000
    end
    
    it 'converts to drams' do
      expect(subject.convert_to(:dr).quantity).to eq 512_000
    end
    
    it 'converts to grains' do
      expect(subject.convert_to(:gr).quantity).to eq 14_000_000
    end
  end
  
  describe 'hundredweights' do
    subject { described_class.parse('20 cwt') }
    
    it 'converts to tons' do
      expect(subject.convert_to(:ton).quantity).to eq 1
    end
    
    it 'converts to pounds' do
      expect(subject.convert_to(:lbs).quantity).to eq 2_000
    end
    
    it 'converts to ounces' do
      expect(subject.convert_to(:oz).quantity).to eq 32_000
    end
    
    it 'converts to drams' do
      expect(subject.convert_to(:dr).quantity).to eq 512_000
    end
    
    it 'converts to grains' do
      expect(subject.convert_to(:gr).quantity).to eq 14_000_000
    end
  end
  
  describe 'pounds' do
    subject { described_class.parse('2000 lbs') }
    
    it 'converts to tons' do
      expect(subject.convert_to(:ton).quantity).to eq 1
    end
    
    it 'converts to hundredweights' do
      expect(subject.convert_to(:cwt).quantity).to eq 20
    end
    
    it 'converts to ounces' do
      expect(subject.convert_to(:oz).quantity).to eq 32_000
    end
    
    it 'converts to drams' do
      expect(subject.convert_to(:dr).quantity).to eq 512_000
    end
    
    it 'converts to grains' do
      expect(subject.convert_to(:gr).quantity).to eq 14_000_000
    end
  end
  
  describe 'ounces' do
    subject { described_class.parse('32000 oz') }
    
    it 'converts to tons' do
      expect(subject.convert_to(:ton).quantity).to eq 1
    end
    
    it 'converts to hundredweights' do
      expect(subject.convert_to(:cwt).quantity).to eq 20
    end
    
    it 'converts to pounds' do
      expect(subject.convert_to(:lbs).quantity).to eq 2_000
    end
    
    it 'converts to drams' do
      expect(subject.convert_to(:dr).quantity).to eq 512_000
    end
    
    it 'converts to grains' do
      expect(subject.convert_to(:gr).quantity).to eq 14_000_000
    end
  end
  
  describe 'drams' do
    subject { described_class.parse('512000 dr') }
    
    it 'converts to tons' do
      expect(subject.convert_to(:ton).quantity).to eq 1
    end
    
    it 'converts to hundredweights' do
      expect(subject.convert_to(:cwt).quantity).to eq 20
    end
    
    it 'converts to pounds' do
      expect(subject.convert_to(:lbs).quantity).to eq 2_000
    end
    
    it 'converts to ounces' do
      expect(subject.convert_to(:oz).quantity).to eq 32_000
    end
    
    it 'converts to grains' do
      expect(subject.convert_to(:gr).quantity).to eq 14_000_000
    end
  end
  
  describe 'grains' do
    subject { described_class.parse('14000000 gr') }
    
    it 'converts to tons' do
      expect(subject.convert_to(:ton).quantity).to eq 1
    end
    
    it 'converts to hundredweights' do
      expect(subject.convert_to(:cwt).quantity).to eq 20
    end
    
    it 'converts to pounds' do
      expect(subject.convert_to(:lbs).quantity).to eq 2_000
    end
    
    it 'converts to ounces' do
      expect(subject.convert_to(:oz).quantity).to eq 32_000
    end
    
    it 'converts to drams' do
      expect(subject.convert_to(:dr).quantity).to eq 512_000
    end
  end
end
