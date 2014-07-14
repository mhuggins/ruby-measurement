# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'kilometers' do
    subject { described_class.parse('1 km') }
    
    it 'converts to hectometers' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'hectometers' do
    subject { described_class.parse('10 hm') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'dekameters' do
    subject { described_class.parse('100 dam') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to hectometers' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'meters' do
    subject { described_class.parse('1000 m') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to hectometers' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'decimeters' do
    subject { described_class.parse('10000 dm') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to hectometers' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'centimeters' do
    subject { described_class.parse('100000 cm') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to hectoliters' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'millimeters' do
    subject { described_class.parse('1000000 mm') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to hectometers' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to micrometers' do
      expect(subject.convert_to(:µm).quantity).to eq 10_000_000
    end
  end
  
  describe 'micrometers' do
    subject { described_class.parse('10000000 µm') }
    
    it 'converts to kilometers' do
      expect(subject.convert_to(:km).quantity).to eq 1
    end
    
    it 'converts to hectometers' do
      expect(subject.convert_to(:hm).quantity).to eq 10
    end
    
    it 'converts to dekameters' do
      expect(subject.convert_to(:dam).quantity).to eq 100
    end
    
    it 'converts to meters' do
      expect(subject.convert_to(:m).quantity).to eq 1_000
    end
    
    it 'converts to decimeters' do
      expect(subject.convert_to(:dm).quantity).to eq 10_000
    end
    
    it 'converts to centimeters' do
      expect(subject.convert_to(:cm).quantity).to eq 100_000
    end
    
    it 'converts to millimeters' do
      expect(subject.convert_to(:mm).quantity).to eq 1_000_000
    end
  end
end
