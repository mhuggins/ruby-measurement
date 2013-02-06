# encoding: UTF-8

require 'spec_helper'

describe Measurement do
  describe 'tonnes' do
    subject { Measurement.parse('0.001 tonne') }
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'kilograms' do
    subject { Measurement.parse('1 kg') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'hectograms' do
    subject { Measurement.parse('10 hg') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'dekagrams' do
    subject { Measurement.parse('100 dag') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'grams' do
    subject { Measurement.parse('1000 g') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'decigrams' do
    subject { Measurement.parse('10000 dg') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'centigrams' do
    subject { Measurement.parse('100000 cg') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'milligrams' do
    subject { Measurement.parse('1000000 mg') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to micrograms' do
      subject.convert_to(:µg).quantity.should eq 10_000_000
    end
  end
  
  describe 'micrograms' do
    subject { Measurement.parse('10000000 µg') }
    
    it 'converts to tonnes' do
      subject.convert_to(:t).quantity.should eq 0.001
    end
    
    it 'converts to kilograms' do
      subject.convert_to(:kg).quantity.should eq 1
    end
    
    it 'converts to hectograms' do
      subject.convert_to(:hg).quantity.should eq 10
    end
    
    it 'converts to dekagrams' do
      subject.convert_to(:dag).quantity.should eq 100
    end
    
    it 'converts to grams' do
      subject.convert_to(:g).quantity.should eq 1_000
    end
    
    it 'converts to decigrams' do
      subject.convert_to(:dg).quantity.should eq 10_000
    end
    
    it 'converts to centigrams' do
      subject.convert_to(:cg).quantity.should eq 100_000
    end
    
    it 'converts to milligrams' do
      subject.convert_to(:mg).quantity.should eq 1_000_000
    end
  end
end
