require 'airport'

describe Airport do
    it 'tells us if the airport is full if full' do
        airport = Airport.new
        expect(airport.is_full?).to eq true
    end
        
    it 'allows the user to set airport capacity' do
      capacity = 50
      airport = Airport.new(capacity)
      expect(airport.capacity).to eq capacity
    end

    it 'sets a default capacity if the user does not specify' do
        airport = Airport.new
        expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
end