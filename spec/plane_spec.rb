require "plane"
require "airport"
require "weather"

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) {
    airport = Airport.new
    allow(airport).to receive(:generate_weather) { "sunny" }
    airport
  }

  # land

  it "responds to land with a airport" do
    expect(plane).to respond_to(:land).with(1).argument
  end

  describe "#land" do
    it "raises error if plane is already landed at an airport" do
      plane.land(airport)
      expect { plane.land airport }.to raise_error "This plane is already landed"
    end
  end

  # take_off

  it "responds to take_off" do
    expect(plane).to respond_to(:take_off)
  end

  describe "#take_off" do
    it "Confirms a plane has left the airport" do
      plane.land(airport)
      expect { plane.take_off }.to output("The plane has departed\n").to_stdout
    end

    it "raises an error if the plane is not at an airport" do
      expect { plane.take_off }.to raise_error "This plane is already in the air"
    end
  end
end
