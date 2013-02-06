require 'spec_helper'

describe Measurement::Unit do
  subject { Measurement::Unit.new(name) }
  
  let(:name) { :hour }
  
  describe '#name' do
    it 'returns the name' do
      subject.name.should eq 'hour'
    end
  end
  
  describe '#add_alias' do
    it 'adds new aliases' do
      subject.add_alias :hr, :hrs
      subject.aliases.should eq %w(hour hr hrs).to_set
    end
    
    it 'does not add aliases that already exist' do
      subject.add_alias :hr, :hrs
      expect { subject.add_alias :hr, :hrs }.to_not raise_error
      subject.aliases.should eq %w(hour hr hrs).to_set
    end
  end
  
  describe '#add_conversion' do
    before do
      subject.add_conversion(:sec) { |value| value * 3600.0 }
    end
    
    it 'adds new conversions' do
      conversion = proc { |value| value * 60.0 }
      subject.add_conversion(:min, &conversion)
      subject.conversions['min'].should be conversion
    end
    
    it 'replaces existing conversions' do
      conversion = proc { |value| value * 60.0 }
      subject.add_conversion(:sec, &conversion)
      subject.conversions['sec'].should be conversion
    end
  end
  
  describe '#aliases' do
    it 'returns the set of aliases' do
      subject.aliases.should eq %w(hour).to_set
    end
  end
  
  describe '#conversion' do
    before do
      Measurement::Unit.define(:min)
      subject.add_conversion(:min) { |value| value * 60.0 }
    end
    
    it 'returns conversion if it exists' do
      subject.conversion(:min).should_not be_nil
    end
    
    it 'returns nil if it does not exist' do
      subject.conversion(:sec).should be_nil
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
    before do
      subject.add_alias(:hours, :hr, :hrs)
      subject.add_conversion(:min) { |value| value * 60.0 }
    end
    
    describe 'other object is a Unit' do
      it 'returns true when name, aliases, and conversions match' do
        other = Measurement::Unit.new(:hour)
        other.add_alias(:hours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60.0 }
        #(subject == other).should be_true
      end
      
      it "returns false when the name doesn't match" do
        other = Measurement::Unit.new(:hoooour)
        other.add_alias(:hours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60.0 }
        (subject == other).should be_false
      end
      
      it "returns false when the aliases don't match" do
        other = Measurement::Unit.new(:hour)
        other.add_alias(:hoooours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60.0 }
        (subject == other).should be_false
      end
      
      it "returns false when the conversions don't match" do
        other = Measurement::Unit.new(:hour)
        other.add_alias(:hours, :hr, :hrs)
        other.add_conversion(:min) { |value| value * 60000.0 }
        (subject == other).should be_false
      end
    end
    
    describe 'other object is not a Unit' do
      it 'returns false' do
        (subject == :hour).should be_false
      end
    end
  end
end
