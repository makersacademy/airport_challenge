require 'airport'
require 'plane'

describe Airport do
  describe ".land" do
    it 'will not raise an error when a plane lands at the airport ' do
      plane = Plane.new
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      expect { airport.land(plane) }.to_not raise_error
    end

    it "will land a plane at the airport" do
      plane = Plane.new
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      airport.land(plane)
      expect(airport.return_planes).to match_array([plane])
    end

    it "will not allow to land plane when airport capcity is reached" do
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      airport.capacity.times { airport.land(Plane.new) }
      expect {airport.land(Plane.new)}.to raise_error("Airport capacity is reached")
    end

    it "will prevent plane to land when weather is stormy" do
      plane = Plane.new
      weather = double("weather", :get_conditions => "stormy")
      airport = Airport.new(25, weather)
      expect { airport.land(plane) }.to raise_error("Stormy conditions - Plane cannot land")
    end
  end

  describe ".take_off" do
    it 'will not raise an error when a plane takes off' do
      plane = Plane.new
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      airport.land(plane)
      expect { airport.take_off(plane) }.to_not raise_error
    end

    it "will raise an error if no plane is available to take off" do
      plane = Plane.new
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      airport.return_planes.count == 0
      expect { airport.take_off(plane) }.to raise_error("No plane available to take off")
    end

    it "will raise an error when a plane taking off is not in the airport" do
      plane1 = Plane.new
      plane2 = Plane.new
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      airport.land(plane1)
      expect { airport.take_off(plane2) }.to raise_error("Plane not available to take off")
    end

    it "will confirm that the plane has taken off and is no longer in the airport" do
      plane1 = Plane.new
      plane2 = Plane.new
      weather = double("weather", :get_conditions => "sunny")
      airport = Airport.new(25, weather)
      airport.land(plane1)
      airport.land(plane2)
      expect(airport.return_planes).to match_array [plane1, plane2]
      airport.take_off(plane1)
      expect(airport.return_planes).to match_array [plane2] 
    end

    it "will prevent plane to take off when weather is stormy" do
      plane = Plane.new
      weather = double("weather", :get_conditions => "stormy")
      airport = Airport.new(25, weather)
      expect { airport.take_off(plane) }.to raise_error("Stormy conditions - Plane cannot take off")
    end

  end

end