require 'spec_helper'

describe Measurement do
  subject { Measurement }
  
  describe '.new' do
    describe 'with valid quantity' do
      it 'sets the quantity'
      it 'sets the default unit'
    end
    
    describe 'with valid quantity and unit name' do
      it 'sets the quantity'
      it 'sets the unit'
    end
    
    describe 'with valid quantity and unit' do
      it 'sets the quantity'
      it 'sets the unit'
    end
    
    describe 'with invalid quantity' do
      it 'raises exception'
    end
    
    describe 'with invalid unit' do
      it 'raises exception'
    end
  end
  
  describe '.parse' do
    describe 'format' do
      it 'parses scientific notation'
      it 'parses fractions'
      it 'parses mixed fractions'
      it 'parses decimals'
    end
    
    describe 'unit' do
      it 'converts when defined'
      it 'raises exception when undefined'
    end
  end
  
  describe '.define' do
    it 'delegates to Unit.define'
  end
  
  describe '#convert_to' do
    describe 'target unit matches current unit' do
      it 'returns self'
    end
    
    describe 'unit exists and is convertable' do
      it 'returns target uit'
    end
    
    describe 'unit exists and is not convertable' do
      it 'raises exception'
    end
    
    describe 'unit does not exist' do
      it 'raises exception'
    end
  end
  
  describe '#convert_to!' do
    it 'modifies the object'
  end
  
  describe '#+' do
    it 'adds numeric values'
    it 'adds units of the same type'
    it 'adds units of a convertable type'
    it 'raises exception for incompatible units'
  end
  
  describe '#-' do
    it 'subtracts numeric values'
    it 'subtracts units of the same type'
    it 'subtracts units of a convertable type'
    it 'raises exception for incompatible units'
  end
  
  describe '#*' do
    it 'multiplies numeric values'
    it 'multiplies units of the same type'
    it 'multiplies units of a convertable type'
    it 'raises exception for incompatible units'
  end
  
  describe '#/' do
    it 'divides numeric values'
    it 'divides units of the same type'
    it 'divides units of a convertable type'
    it 'raises exception for incompatible units'
  end
  
  describe '#**' do
    it 'raises to the power of numeric values'
    it 'raises exception for non-numeric values'
  end
  
  describe '#==' do
    it 'returns true for measurements with same quantity and unit'
    it 'returns false for measurements with same quantity and different unit'
    it 'returns false for measurements with same unit and different quantity'
    it 'returns false for non-measurement objects'
  end
  
  describe '#to_s' do
    it 'returns the quantity and unit'
  end
  
  describe '#inspect' do
    it 'returns the quantity and unit'
  end
end
