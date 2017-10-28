require "airport"
require "plane"
require "weather"

describe Airport do

  subject(:airport) { described_class.new }

  it "plane should be allowed to land" do
    plane = Plane.new
    expect(airport.land(plane)).to eq true
  end

  it "plane should be able to take off" do
    plane = Plane.new
    weather = Weather.new
    expect(airport.take_off(plane,weather)).to eq true
  end

  it "if stormy, plane does NOT take off" do
    plane = Plane.new
    weather = Weather.new
    expect(weather.clear?).to eq (airport.take_off(plane,weather))
  end

  it "if stormy, plane does NOT land" do
    plane = Plane.new
    weather = Weather.new
    expect(weather.clear?).to eq (airport.land(plane))
  end
end
