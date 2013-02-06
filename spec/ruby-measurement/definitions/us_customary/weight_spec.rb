# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'tons' do
    subject { Measurement.parse('1 ton') }
    
    it 'converts to hundredweights' do
      subject.convert_to(:cwt).quantity.should eq 20
    end
    
    it 'converts to pounds' do
      subject.convert_to(:lbs).quantity.should eq 2_000
    end
    
    it 'converts to ounces' do
      subject.convert_to(:oz).quantity.should eq 32_000
    end
    
    it 'converts to drams' do
      subject.convert_to(:dr).quantity.should eq 512_000
    end
    
    it 'converts to grains' do
      subject.convert_to(:gr).quantity.should eq 14_000_000
    end
  end
  
  describe 'hundredweights' do
    subject { Measurement.parse('20 cwt') }
    
    it 'converts to tons' do
      subject.convert_to(:ton).quantity.should eq 1
    end
    
    it 'converts to pounds' do
      subject.convert_to(:lbs).quantity.should eq 2_000
    end
    
    it 'converts to ounces' do
      subject.convert_to(:oz).quantity.should eq 32_000
    end
    
    it 'converts to drams' do
      subject.convert_to(:dr).quantity.should eq 512_000
    end
    
    it 'converts to grains' do
      subject.convert_to(:gr).quantity.should eq 14_000_000
    end
  end
  
  describe 'pounds' do
    subject { Measurement.parse('2000 lbs') }
    
    it 'converts to tons' do
      subject.convert_to(:ton).quantity.should eq 1
    end
    
    it 'converts to hundredweights' do
      subject.convert_to(:cwt).quantity.should eq 20
    end
    
    it 'converts to ounces' do
      subject.convert_to(:oz).quantity.should eq 32_000
    end
    
    it 'converts to drams' do
      subject.convert_to(:dr).quantity.should eq 512_000
    end
    
    it 'converts to grains' do
      subject.convert_to(:gr).quantity.should eq 14_000_000
    end
  end
  
  describe 'ounces' do
    subject { Measurement.parse('32000 oz') }
    
    it 'converts to tons' do
      subject.convert_to(:ton).quantity.should eq 1
    end
    
    it 'converts to hundredweights' do
      subject.convert_to(:cwt).quantity.should eq 20
    end
    
    it 'converts to pounds' do
      subject.convert_to(:lbs).quantity.should eq 2_000
    end
    
    it 'converts to drams' do
      subject.convert_to(:dr).quantity.should eq 512_000
    end
    
    it 'converts to grains' do
      subject.convert_to(:gr).quantity.should eq 14_000_000
    end
  end
  
  describe 'drams' do
    subject { Measurement.parse('512000 dr') }
    
    it 'converts to tons' do
      subject.convert_to(:ton).quantity.should eq 1
    end
    
    it 'converts to hundredweights' do
      subject.convert_to(:cwt).quantity.should eq 20
    end
    
    it 'converts to pounds' do
      subject.convert_to(:lbs).quantity.should eq 2_000
    end
    
    it 'converts to ounces' do
      subject.convert_to(:oz).quantity.should eq 32_000
    end
    
    it 'converts to grains' do
      subject.convert_to(:gr).quantity.should eq 14_000_000
    end
  end
  
  describe 'grains' do
    subject { Measurement.parse('14000000 gr') }
    
    it 'converts to tons' do
      subject.convert_to(:ton).quantity.should eq 1
    end
    
    it 'converts to hundredweights' do
      subject.convert_to(:cwt).quantity.should eq 20
    end
    
    it 'converts to pounds' do
      subject.convert_to(:lbs).quantity.should eq 2_000
    end
    
    it 'converts to ounces' do
      subject.convert_to(:oz).quantity.should eq 32_000
    end
    
    it 'converts to drams' do
      subject.convert_to(:dr).quantity.should eq 512_000
    end
  end
end
