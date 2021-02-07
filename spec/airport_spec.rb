require "airport.rb"

class Plane
end

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double :plane}

  before(:each) do
    #allow(plane).to receive(land).and_return(true)
    airport.instance_variable_set(:@planes, (1..5).map { Plane.new })
    airport.weather = "sunny"
  end

  context "weather is good" do
    it "a plane lands at the airport" do
      expect(airport.planes).not_to include(plane)
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

    it "a plane takes off from the airport" do
      airport.instance_variable_set(:@planes, [plane])
      airport.takeoff(plane)
      expect(airport.planes).not_to include(plane)
    end
  end

  it "a plane doesn't land when airport is full" do
    airport.instance_variable_set(:@max_capacity, 10)
    airport.instance_variable_set(:@planes, (1..10).map { Plane.new })
    expect { airport.land(plane) }.to raise_error("Airport at capacity")
  end

  it "set maximum capacity" do
    3.times {
      capacity = rand(1..100)
      airport.instance_variable_set(:@max_capacity, capacity)
      expect(airport.max_capacity).to eq capacity
    }
  end

  it "plane cannot takeoff if it's not in the same airport" do
    airport.instance_variable_set(:@planes, [])
    expect { airport.takeoff(plane) }.to raise_error("Plane is not in this airport")
  end

  context "when weather is bad" do
    before do
      airport.weather = "stormy"
    end

    it "planes cannot land" do
      expect { airport.land(plane) }.to raise_error("Weather is unsafe")
      expect(airport.planes).not_to include(plane)
    end

    it "planes cannot takeoff" do
      airport.instance_variable_set(:@planes, [plane])
      expect { airport.land(plane) }.to raise_error("Weather is unsafe")
      expect(airport.planes).to include(plane)
    end
  end
end