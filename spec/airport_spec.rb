require 'airport'

RSpec.describe Airport do

  describe '#land' do
    it 'land a plane at an airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.airport_array.length).to eq 1
    end
  end

  describe '#take_off' do
    it 'a plane takes off from an airport and confirms it is no longer at the airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "The plane has successfully left the airport"
    end
  end

  describe '#take_off' do
    it 'if the weather is stormy, prevent take off' do
      airport = Airport.new(5, :stormy)
      plane = Plane.new
      expect { airport.take_off(plane) }.to raise_error("It is too stormy to take off")
    end
  end

  describe "#full?" do
    it 'if an airport is full, you will not be able to land a plane there' do
      airport = Airport.new(0)
      plane = Plane.new
      expect { airport.land(plane) }.to raise_error("The airport is full")
    end
  end
end

RSpec.describe Plane do

end
