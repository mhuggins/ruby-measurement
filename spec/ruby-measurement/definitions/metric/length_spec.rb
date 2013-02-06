# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'kilometers' do
    subject { Measurement.parse('1 km') }
    
    it 'converts to hectometers' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'hectometers' do
    subject { Measurement.parse('10 hm') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'dekameters' do
    subject { Measurement.parse('100 dam') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to hectometers' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'meters' do
    subject { Measurement.parse('1000 m') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to hectometers' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'decimeters' do
    subject { Measurement.parse('10000 dm') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to hectometers' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'centimeters' do
    subject { Measurement.parse('100000 cm') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to hectoliters' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'millimeters' do
    subject { Measurement.parse('1000000 mm') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to hectometers' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to micrometers' do
      subject.convert_to(:µm).quantity.should eq 10_000_000
    end
  end
  
  describe 'micrometers' do
    subject { Measurement.parse('10000000 µm') }
    
    it 'converts to kilometers' do
      subject.convert_to(:km).quantity.should eq 1
    end
    
    it 'converts to hectometers' do
      subject.convert_to(:hm).quantity.should eq 10
    end
    
    it 'converts to dekameters' do
      subject.convert_to(:dam).quantity.should eq 100
    end
    
    it 'converts to meters' do
      subject.convert_to(:m).quantity.should eq 1_000
    end
    
    it 'converts to decimeters' do
      subject.convert_to(:dm).quantity.should eq 10_000
    end
    
    it 'converts to centimeters' do
      subject.convert_to(:cm).quantity.should eq 100_000
    end
    
    it 'converts to millimeters' do
      subject.convert_to(:mm).quantity.should eq 1_000_000
    end
  end
end
