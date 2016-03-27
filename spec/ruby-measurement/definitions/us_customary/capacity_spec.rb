# encoding: UTF-8

require 'spec_helper'

RSpec.describe Measurement do
  describe 'acre-feet' do
    subject { described_class.parse('1 acre ft') }

    it 'converts to cubic yards' do
      expect(subject.convert_to(:yd3).quantity).to eq Rational(4840, 3).to_f
    end

    it 'converts to cubic feet' do
      expect(subject.convert_to(:ft3).quantity).to eq 43_560
    end

    it 'converts to cubic inches' do
      expect(subject.convert_to(:in3).quantity).to eq 75_271_680
    end
  end

  describe 'cubic yards' do
    subject { described_class.parse('1613 1/3 yd³') }

    it 'converts to acre-feet' do
      expect(subject.convert_to(:'acre ft').quantity).to eq 1
    end

    it 'converts to cubic feet' do
      expect(subject.convert_to(:ft3).quantity).to eq 43_560
    end

    it 'converts to cubic inches' do
      expect(subject.convert_to(:in3).quantity).to eq 75_271_680
    end
  end

  describe 'cubic feet' do
    subject { described_class.parse('43560 ft³') }

    it 'converts to acre-feet' do
      expect(subject.convert_to(:'acre ft').quantity).to eq 1
    end

    it 'converts to cubic yards' do
      expect(subject.convert_to(:yd3).quantity).to eq Rational(4840, 3).to_f
    end

    it 'converts to cubic inches' do
      expect(subject.convert_to(:in3).quantity).to eq 75_271_680
    end
  end

  describe 'cubic inches' do
    subject { described_class.parse('75271680 in³') }

    it 'converts to acre-feet' do
      expect(subject.convert_to(:'acre ft').quantity).to eq 1
    end

    it 'converts to cubic yards' do
      expect(subject.convert_to(:yd3).quantity).to eq Rational(4840, 3).to_f
    end

    it 'converts to cubic feet' do
      expect(subject.convert_to(:ft3).quantity).to eq 43_560
    end
  end
end
