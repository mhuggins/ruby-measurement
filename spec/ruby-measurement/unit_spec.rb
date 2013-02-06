require 'spec_helper'

describe Measurement::Unit do
  subject { Measurement::Unit.new(name) }
  
  let(:name) { :hour }
  
  describe '#name' do
    it 'should return the name' do
      subject.name.should eq 'hour'
    end
  end
  
  describe '#add_alias' do
    describe 'when the alias is new' do
      it 'should add the alias'
    end
    
    describe 'when the alias exists' do
      it 'should not add the alias'
    end
  end
  
  describe '#add_conversion' do
    it 'should add a conversion'
  end
  
  describe '#aliases' do
    it 'should return the set of aliases' do
      subject.aliases.should eq %w(hour).to_set
    end
  end
  
  describe '#convert_to' do
    describe 'target unit matches current unit' do
      it 'should return self'
    end
    
    describe 'unit exists and is convertable' do
      it 'should return target uit'
    end
    
    describe 'unit exists and is not convertable' do
      it 'should raise exception'
    end
    
    describe 'unit does not exist' do
      it 'should raise exception'
    end
  end
  
  describe '#inspect' do
    it 'returns name' do
      subject.inspect.should eq subject.name
    end
  end
  
  describe '#to_s' do
    it 'returns name' do
      subject.inspect.should eq subject.name
    end
  end
  
  describe '#==' do
    describe 'other object is a Unit' do
      describe 'with the same name and same aliases' do
        it 'matches'
      end
      
      describe 'with the same name and different aliases' do
        it "doesn't match"
      end
      
      describe 'with a different name' do
        it "doesn't match"
      end
    end
    
    describe 'other object is not a Unit' do
      it "doesn't match"
    end
  end
end
