require './lib/airport'
require 'pry'

describe Airport do
  describe 'is_full?' do
    it 'has the get is_full? method' do
      expect(Airport.new.is_full?)
    end

    it 'returns false when number_of_landed_planes is less then the capcity' do
      a = Airport.new
      allow(a).to receive(:capacity).and_return(10)
      a.number_of_landed_planes =  2

      expect(a.is_full?).to eq false
    end

    it 'returns true when number_of_landed_planes is greater then the capcity' do
      a = Airport.new
      allow(a).to receive(:capacity).and_return(10)
      a.number_of_landed_planes = 12

      expect(a.is_full?).to eq true
    end
  end

  describe 'capacity' do
    it 'has a capacity of 10' do
      expect(Airport.new.capacity).to eq (10)
    end
  end

  describe 'number_of_landed_planes' do
    it 'starts with a default of 0' do
      expect(Airport.new.number_of_landed_planes).to eq (0)
    end
  end
end