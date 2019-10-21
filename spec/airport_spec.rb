require 'plane.rb'
require 'airport.rb'
require 'weather.rb'

describe Plane do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  let(:today) {Weather.new}

  context "airport capacity" do

    it "a new airport is created with a default capacity of 20" do
      expect(airport.capacity).to eq(20)
    end

    it "a new airport can be created with a custom capacity" do
      sml_airport = Airport.new(5)
      expect(sml_airport.capacity).to eq(5)
    end
  end

  context "landing a plane" do

    it "lands a plane in an airport" do
      allow(today).to receive(:forecast) {"sunny"}
      expect(airport.land(plane, today)).to eq("The plane has safely landed")
    end

    it "when a plane lands the airport stores the plane" do
      airport.land(plane, today)
      expect(airport.grounded_planes).to include(plane)
    end

    it "a plane that is already landed cannot land again" do
      plane.landed
      expect{airport.land(plane, today)}.to raise_error("That plane has already landed")
    end

    it "a plane cannot land if the airport is full" do
      allow(today).to receive(:forecast) {"sunny"}
      airport.capacity.times { airport.land(Plane.new, today) }
      expect{airport.land(plane, today)}.to raise_error("There are too many planes in the airport")
    end

  end

  context "plane taking off" do

    it "plane takes off from an airport" do
      allow(today).to receive(:forecast) {"sunny"}
      airport.land(plane, today)
      expect(airport.takeoff(plane, today)).to eq("The plane is in the air")
    end

    it "confirms when a plane takes off it is no longer in the airport" do
      allow(today).to receive(:forecast) {"sunny"}
      airport.land(plane, today)
      airport.takeoff(plane, today)
      expect(airport.grounded_planes).not_to include(plane)
    end

    it "a plane that is not already in the airport cannot take off" do
      allow(today).to receive(:forecast) {"sunny"}
      expect{airport.takeoff(plane, today)}.to raise_error("That plane is not in this airport")
    end

  end

  context "weather conditions" do

    it "plane cannot take off if weather is stormy" do
      sunny_weather = Weather.new
      stormy_weather = Weather.new
      allow(sunny_weather).to receive(:forecast) {"sunny"}
      allow(stormy_weather).to receive(:forecast) {"stormy"}
      airport.land(plane, sunny_weather)
      expect{airport.takeoff(plane, stormy_weather)}.to raise_error("It is too stormy for takeoff")
    end

    it "plane cannot land if weather is stormy" do
      allow(today).to receive(:forecast) {"stormy"}
      expect{airport.land(plane, today)}.to raise_error("It is too stormy to land")
    end

  end

end
