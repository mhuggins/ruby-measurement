require 'spec_helper'

RSpec.describe Measurement::Unit do
  subject { described_class.new(name) }
  
  let(:name) { :hour }
  
  describe '#name' do
    it 'returns the name' do
      expect(subject.name).to eq 'hour'
    end
  end
  
  describe '#add_alias' do
    it 'adds new aliases' do
      subject.add_alias :hr, :hrs
      expect(subject.aliases).to eq %w(hour hr hrs).to_set
    end
    
    it 'does not add aliases that already exist' do
      subject.add_alias :hr, :hrs
      expect { subject.add_alias :hr, :hrs }.to_not raise_error
      expect(subject.aliases).to eq %w(hour hr hrs).to_set
    end
  end
  
  describe '#add_conversion' do
    before do
      subject.add_conversion(:sec) { |value| value * 3600.0 }
    end
    
    it 'adds new conversions' do
      conversion = proc { |value| value * 60.0 }
      subject.add_conversion(:min, &conversion)
      expect(subject.conversions['min']).to be conversion
    end
    
    it 'replaces existing conversions' do
      conversion = proc { |value| value * 60.0 }
      subject.add_conversion(:sec, &conversion)
      expect(subject.conversions['sec']).to be conversion
    end
  end
  
  describe '#aliases' do
    it 'returns the set of aliases' do
      expect(subject.aliases).to eq %w(hour).to_set
    end
  end
  
  describe '#conversion' do
    before do
      described_class.define(:min)
      subject.add_conversion(:min) { |value| value * 60.0 }
    end
    
    it 'returns conversion if it exists' do
      expect(subject.conversion(:min)).to_not be_nil
    end
    
    it 'returns nil if it does not exist' do
      expect(subject.conversion(:sec)).to be_nil
    end
  end
  
  describe '#inspect' do
    it 'returns name' do
      expect(subject.inspect).to eq subject.name
    end
  end
  
  describe '#to_s' do
    it 'returns name' do
      expect(subject.inspect).to eq subject.name
    end
  end
  
  describe '#==' do
    before do
      subject.add_alias(:hours, :hr, :hrs)
      subject.add_conversion(:min) { |value| value * 60.0 }
    end
    
    describe 'other object is a Unit' do
      it 'returns true when name, aliases, and conversions match' do
        other = described_class.new(:hour)
        other.add_alias(:hours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60.0 }
        expect(subject == other).to be true
      end
      
      it "returns false when the name doesn't match" do
        other = described_class.new(:hoooour)
        other.add_alias(:hours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60.0 }
        expect(subject == other).to be false
      end
      
      it "returns false when the aliases don't match" do
        other = described_class.new(:hour)
        other.add_alias(:hoooours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60.0 }
        expect(subject == other).to be false
      end
      
      it "returns false when the conversions don't match" do
        other = described_class.new(:hour)
        other.add_alias(:hours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60000.0 }
        expect(subject == other).to be false
      end
    end
    
    describe 'other object is not a Unit' do
      it 'returns false' do
        expect(subject == :hour).to be false
      end
    end
  end
  
  describe '.names' do
    subject { described_class }
    
    it 'returns all defined unit names' do
      unit_names = subject.names
      expect(unit_names).to be_an Array
      expect(unit_names).to include 'count'
    end
  end
  
  describe '.define' do
    subject { described_class }
    
    it 'returns a unit builder' do
      builder = subject.define(:count)
      expect(builder).to be_a Measurement::Unit::Builder
    end
    
    it 'accepts a block' do
      builder = subject.define(:count) { |b| b.alias :ct }
      expect(builder).to be_a Measurement::Unit::Builder
    end
  end
  
  describe '.[]' do
    subject { described_class }
    
    describe 'for a unit name that is defined' do
      it 'returns the unit' do
        unit = subject[:dozen]
        expect(unit).to be_a described_class
        expect(unit.name).to eq 'doz'
        expect(unit.aliases).to eq %w(doz dozen).to_set
      end
    end
    
    describe 'for a unit name that is not defined' do
      it 'returns nil' do
        expect(subject[:potato]).to be nil
      end
    end
  end
end
