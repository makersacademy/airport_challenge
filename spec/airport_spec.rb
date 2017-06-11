require "airport.rb"

describe Airport do
  let(:sunny_weather_provider) { double(:weather, :generator => "sunny") }
  let(:airport) { Airport.new(sunny_weather_provider) }
  let(:other_airport) { Airport.new(sunny_weather_provider) }

  it "responds to land message" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "allows system designers to set the capacity" do
    num = 10
    airport = Airport.new(sunny_weather_provider, num)
    expect(airport.capacity).to eq num
  end

  describe "#condition_for_landing" do
    it "raises an error if a plane on the ground receives the message to land" do
      plane = double(:plane, :airport_to_land => airport, :airport_take_off => airport, :on_the_ground => true)
      expect { airport.condition_for_landing(plane) }.to raise_error("Plane on the ground, can't land")
    end
    it "raises and error if a plane tries to land at a different airport than instructed" do
      plane_instructed_to_land_other_airport = double(:plane, :airport_to_land => other_airport, :on_the_ground => false)
      expect { airport.land(plane_instructed_to_land_other_airport) }.to raise_error("Plane is not instructed to land at this airport")
    end
    it "raises an error if the weather is stormy" do
      stormy_weather_provider = double(:weather, :generator => "stormy")
      airport = Airport.new(stormy_weather_provider)
      plane = double(:plane, :airport_to_land => airport, :airport_take_off => airport, :on_the_ground => false)
      expect { airport.condition_for_landing(plane) }.to raise_error("Weather too stormy to land")
    end
    it "raises an error when the airport is at full capcity" do
      plane = double(:plane, :airport_to_land => airport, :on_the_ground => false)
      airport.capacity.times { airport.land(plane) }
      expect { airport.condition_for_landing(plane) }.to raise_error("Airport is full, there is no space to land")
    end
  end

  describe "#land" do
    it "allows planes to land if they receievd instruction to land at the airport" do
      plane = double(:plane, :airport_to_land => airport, :on_the_ground => false)
      airport.land(plane)
      expect(airport.planes.last).to eq plane
      expect(plane.airport_to_land).to eq airport
    end
  end

  describe "#confirm_landing" do
    it "confirms a plane has landed at the correct airport" do
      plane = double(:plane, :airport_to_land => airport, :on_the_ground => false)
      airport.land(plane)
      expect(airport.confirm_landing(plane)).to eq true
      expect(airport).to eq plane.airport_to_land
    end
  end

  describe "#condition_for_takeoff" do
    it "raises an error when a plane in the air is instructed to take off" do
      plane = double(:plane, :on_the_ground => false, :airport_to_land => airport, :airport_take_off => airport)
      expect { airport.condition_for_takeoff(plane) }.to raise_error("Plane in the air, can't take off")
    end
    it "raises an error when a plane is instructed to take off from a different airport than the one its in" do
      plane = double(:plane, :on_the_ground => true, :airport_to_land => airport, :airport_take_off => other_airport)
      expect { airport.condition_for_takeoff(plane) }.to raise_error("Plane in a different airport than the one its instructed to take off")
    end
    it "raises an error when the weather is stormy" do
      stormy_weather_provider = double(:weather, :generator => "stormy")
      airport = Airport.new(stormy_weather_provider)
      plane = double(:plane, :on_the_ground => true, :airport_to_land => airport, :airport_take_off => airport)
      expect { airport.condition_for_takeoff(plane) }.to raise_error("Weather too stormy to take off")
    end
  end

  describe "#take_off" do
    it "allows planes to take off if they receievd instruction to take off from airport" do
      plane = Plane.new
      plane.instruct_to_land(airport)
      plane.instruct_take_off(airport)
      expect(plane.airport_take_off).to eq airport
    end
  end

  describe "#confirm_take_off" do
    it "confirms a plane has taken off" do
      plane = Plane.new
      plane.instruct_to_land(airport)
      plane.instruct_take_off(airport)
      expect(airport.confirm_take_off(plane)).to eq true
    end
  end

end
