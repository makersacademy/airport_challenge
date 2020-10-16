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

end

RSpec.describe Plane do

end
