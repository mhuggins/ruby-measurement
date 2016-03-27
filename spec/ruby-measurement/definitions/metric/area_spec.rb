# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'square kilometers' do
    subject { described_class.parse('10 km²') }

    it 'converts to hectares' do
      expect(subject.convert_to(:ha).quantity).to eq 1_000
    end

    it 'converts to ares' do
      expect(subject.convert_to(:a).quantity).to eq 100_000
    end

    it 'converts to square centimeters' do
      expect(subject.convert_to(:cm2).quantity).to eq 100_000_000_000
    end
  end

  describe 'hectares' do
    subject { described_class.parse('10 ha') }

    it 'converts to square kilometers' do
      expect(subject.convert_to(:km2).quantity).to eq 0.1
    end

    it 'converts to ares' do
      expect(subject.convert_to(:a).quantity).to eq 1_000
    end

    it 'converts to square centimeters' do
      expect(subject.convert_to(:cm2).quantity).to eq 1_000_000_000
    end
  end

  describe 'ares' do
    subject { described_class.parse('1000 a') }

    it 'converts to square kilometers' do
      expect(subject.convert_to(:km2).quantity).to eq 0.1
    end

    it 'converts to hectares' do
      expect(subject.convert_to(:ha).quantity).to eq 10
    end

    it 'converts to square centimeters' do
      expect(subject.convert_to(:cm2).quantity).to eq 1_000_000_000
    end
  end

  describe 'square centimeters' do
    subject { described_class.parse('10000000000 cm²') }

    it 'converts to square kilometers' do
      expect(subject.convert_to(:km2).quantity).to eq 1
    end

    it 'converts to hectares' do
      expect(subject.convert_to(:ha).quantity).to eq 100
    end

    it 'converts to ares' do
      expect(subject.convert_to(:a).quantity).to eq 10_000
    end
  end
end
