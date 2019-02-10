require "air_traffic_controller"

describe AirTrafficController do
  context "#instruct_landing" do
    it "instructs landing if not stormy" do
      plane = Plane.new
      airport = Airport.new
      weather = double("weather")
      weather.stub(:stormy?) {false}
      subject.instruct_landing(airport, plane, weather)
      expect(airport.contains(plane)).to eq true
    end
    it "instructs NOT to land if stormy" do
      plane = Plane.new
      airport = Airport.new
      weather = double("weather")
      weather.stub(:stormy?) {true}
      expect { subject.instruct_landing(airport, plane, weather) }.to raise_error "Not safe to land when there is a storm!"
      expect(airport.contains(plane)).to eq false
    end

    it "instructs NOT to land if airport is full" do
      airport = Airport.new(10)
      airport.capacity.times { airport.accept Plane.new }
      plane = Plane.new
      weather = double("weather")
      weather.stub(:stormy?) {false}
      expect { subject.instruct_landing(airport, plane, weather) }.to raise_error "Airport is at full capacity, cannot land plane"
      expect(airport.contains(plane)).to eq false
    end
  end

  context "#instruct_takeoff" do
    it "instructs take off if not stormy" do
      plane = Plane.new
      airport = Airport.new
      airport.accept(plane)
      weather = double("weather")
      weather.stub(:stormy?) {false}
      subject.instruct_takeoff(airport, plane, weather)
      expect(airport.contains(plane)).to eq false
    end

    it "instructs NOT to take off if stormy" do
      plane = Plane.new
      airport = Airport.new
      airport.accept(plane)
      weather = double("weather")
      weather.stub(:stormy?) {true}
      expect { subject.instruct_takeoff(airport, plane, weather) }.to raise_error "Not safe to take off when there is a storm!"
      expect(airport.contains(plane)).to eq true
    end

  end
end
