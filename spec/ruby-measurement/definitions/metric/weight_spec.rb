# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'tonnes' do
    subject { described_class.parse('0.001 tonne') }

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'kilograms' do
    subject { described_class.parse('1 kg') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'hectograms' do
    subject { described_class.parse('10 hg') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'dekagrams' do
    subject { described_class.parse('100 dag') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'grams' do
    subject { described_class.parse('1000 g') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'decigrams' do
    subject { described_class.parse('10000 dg') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'centigrams' do
    subject { described_class.parse('100000 cg') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'milligrams' do
    subject { described_class.parse('1000000 mg') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to micrograms' do
      expect(subject.convert_to(:µg).quantity).to eq 10_000_000
    end
  end

  describe 'micrograms' do
    subject { described_class.parse('10000000 µg') }

    it 'converts to tonnes' do
      expect(subject.convert_to(:t).quantity).to eq 0.001
    end

    it 'converts to kilograms' do
      expect(subject.convert_to(:kg).quantity).to eq 1
    end

    it 'converts to hectograms' do
      expect(subject.convert_to(:hg).quantity).to eq 10
    end

    it 'converts to dekagrams' do
      expect(subject.convert_to(:dag).quantity).to eq 100
    end

    it 'converts to grams' do
      expect(subject.convert_to(:g).quantity).to eq 1_000
    end

    it 'converts to decigrams' do
      expect(subject.convert_to(:dg).quantity).to eq 10_000
    end

    it 'converts to centigrams' do
      expect(subject.convert_to(:cg).quantity).to eq 100_000
    end

    it 'converts to milligrams' do
      expect(subject.convert_to(:mg).quantity).to eq 1_000_000
    end
  end
end
