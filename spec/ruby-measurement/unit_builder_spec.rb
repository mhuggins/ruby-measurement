require 'spec_helper'

RSpec.describe Measurement::Unit::Builder do
  subject { described_class.new(name, &block) }
  
  let(:name) { :hour }
  let(:block) { proc {} }
  
  describe '.new' do
    describe 'with a block' do
      let(:block) do
        proc { |unit| unit.alias :hr, :hrs }
      end
      
      it 'should evaluate the block' do
        unit = subject.to_unit
        expect(unit.aliases).to include 'hr'
        expect(unit.aliases).to include 'hrs'
      end
    end
    
    describe 'without a block' do
      let(:block) { nil }
      
      it 'should not evaluate the block' do
        unit = subject.to_unit
        expect(unit.aliases).to_not include 'hr'
      end
    end
  end
  
  describe '#to_unit' do
    it 'should return a matching unit' do
      expect(subject.to_unit).to be_a Measurement::Unit
      expect(subject.to_unit.name).to eq 'hour'
      expect(subject.to_unit.aliases).to eq %w(hour).to_set
    end
  end
  
  describe '#alias' do
    describe 'with a new alias' do
      before do
        expect(subject.to_unit.aliases).to_not include 'hr'
      end
      
      it 'should append the new alias' do
        aliases = subject.to_unit.aliases.dup
        subject.alias :hr
        expect(subject.to_unit.aliases.size).to eq aliases.size + 1
        expect(subject.to_unit.aliases).to include 'hr'
      end
    end
    
    describe 'with multiple new aliases' do
      before do
        expect(subject.to_unit.aliases).to_not include 'hr'
        expect(subject.to_unit.aliases).to_not include 'hrs'
      end
    end
    
    describe 'with an existing alias' do
      before do
        subject.alias :hour
      end
      
      it 'should not affect the list of aliases' do
        aliases = subject.to_unit.aliases.dup
        subject.alias :hour
        expect(subject.to_unit.aliases).to eq aliases
      end
    end
  end
  
  describe '#convert_to' do
    describe 'with a new target alias' do
      before do
        expect(subject.to_unit.conversions['min']).to be_nil
      end
      
      it 'should add the conversion' do
        conversion = proc { |value| value * 60.0 }
        expect(subject.to_unit.aliases).to_not include 'hr'
        subject.convert_to(:min, &conversion)
        expect(subject.to_unit.conversions['min']).to eq conversion
      end
    end
    
    describe 'with an existing target alias' do
      before do
        subject.convert_to(:min) { |value| value + 3 }
        expect(subject.to_unit.conversions['min']).to_not be_nil
      end
      
      it 'should replace the conversion' do
        conversion = proc { |value| value * 60.0 }
        expect(subject.to_unit.aliases).to_not include 'hr'
        subject.convert_to(:min, &conversion)
        expect(subject.to_unit.conversions['min']).to eq conversion
      end
    end
  end
end
