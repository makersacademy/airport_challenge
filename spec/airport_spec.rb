require 'airports'
require 'planes'

describe Airport do
  describe '#default_capacity' do
    it 'has a default capacity' do
      airport = Airport.new
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
   describe '#taking_off' do
     it 'expects airport to respond to taking_off method' do
      airport = Airport.new
      expect(airport).to respond_to(:taking_off)
     end
    it 'checks that the number of planes in the airport has decreased by one' do
      airport = Airport.new
      if :planes.length > 2
      expect{airport.taking_off}.to change{:planes.length}.by(-1)
    end
  end
end
  describe '#landing' do
    it 'expect airport to respond to the airport_full? method' do
      airport = Airport.new
      expect(airport).to respond_to(:airport_full?)
    end
    it 'expects airport full to be true' do
      airport = Airport.new
       if :capacity >= :planes
      expect(airport.airport_full?).to eq true
      end
    end
    it 'it raises an error to prevents landing if airport is full' do
      airport = Airport.new
      if :capacity >= :planes
      expect{airport.plane_landing}.to raise_error 'airport full'
      end
    end
  end
end
