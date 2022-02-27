require 'airport'
require 'plane'

describe Airport do
  describe ".land" do
    it 'will not raise an error when landing a plane' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.land(plane) }.to_not raise_error
    end

    it "will land a plane at the airport" do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.return_planes).to match_array([plane])
    end
  end

  describe ".take_off" do
    it 'will not raise an error when a plane takes off' do
      airport = Airport.new
      plane = Plane.new
      expect { airport.take_off(plane) }.to_not raise_error
    end

    # it "will land a plane at the airport" do
    #   airport = Airport.new
    #   plane = Plane.new
    #   airport.land(plane)
    #   expect(airport.return_planes).to match_array([plane])
    # end
  end

end

