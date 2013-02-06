require 'spec_helper'

describe Measurement::Unit::Builder do
  subject { Measurement::Unit::Builder.new(name, &block) }
  
  let(:name) { :hour }
  let(:block) { proc {} }
  
  describe '.new' do
    describe 'with a block' do
      let(:block) do
        proc { |unit| unit.alias :hr, :hrs }
      end
      
      it 'should evaluate the block' do
        unit = subject.to_unit
        unit.aliases.should include 'hr'
        unit.aliases.should include 'hrs'
      end
    end
    
    describe 'without a block' do
      let(:block) { nil }
      
      it 'should not evaluate the block' do
        unit = subject.to_unit
        unit.aliases.should_not include 'hr'
      end
    end
  end
  
  describe '#to_unit' do
    it 'should return a matching unit' do
      subject.to_unit.should be_a Measurement::Unit
      subject.to_unit.name.should eq 'hour'
      subject.to_unit.aliases.should eq %w(hour).to_set
    end
  end
  
  describe '#alias' do
    describe 'with a new alias' do
      before do
        subject.to_unit.aliases.should_not include 'hr'
      end
      
      it 'should append the new alias' do
        aliases = subject.to_unit.aliases.dup
        subject.alias :hr
        subject.to_unit.aliases.size.should eq aliases.size + 1
        subject.to_unit.aliases.should include 'hr'
      end
    end
    
    describe 'with multiple new aliases' do
      before do
        subject.to_unit.aliases.should_not include 'hr'
        subject.to_unit.aliases.should_not include 'hrs'
      end
    end
    
    describe 'with an existing alias' do
      before do
        subject.alias :hour
      end
      
      it 'should not affect the list of aliases' do
        aliases = subject.to_unit.aliases.dup
        subject.alias :hour
        subject.to_unit.aliases.should eq aliases
      end
    end
  end
  
  describe '#convert_to' do
    describe 'with a new target alias' do
      before do
        subject.to_unit.conversions['min'].should be nil
      end
      
      it 'should add the conversion' do
        conversion = proc { |value| value * 60.0 }
        subject.to_unit.aliases.should_not include 'hr'
        subject.convert_to(:min, &conversion)
        subject.to_unit.conversions['min'].should eq conversion
      end
    end
    
    describe 'with an existing target alias' do
      before do
        subject.convert_to(:min) { |value| value + 3 }
        subject.to_unit.conversions['min'].should_not be nil
      end
      
      it 'should replace the conversion' do
        conversion = proc { |value| value * 60.0 }
        subject.to_unit.aliases.should_not include 'hr'
        subject.convert_to(:min, &conversion)
        subject.to_unit.conversions['min'].should eq conversion
      end
    end
  end
end
