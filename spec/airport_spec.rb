require "airport"
require "plane"
require "weather"

describe Airport do

  subject(:airport) { described_class.new }
  DEFAULT_CAPACITY = 20

  it "plane should be allowed to land" do
    plane = Plane.new
    weather = Weather.new
    expect(airport.land(plane,weather)).to eq true
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
    expect(weather.clear?).to eq (airport.land(plane,weather))
  end

  it "raises an error if terminal is full" do
    plane = Plane.new
    weather = Weather.new
    Airport::DEFAULT_CAPACITY.times{airport.land(plane,weather)}
    expect{ airport.land(plane,weather) }.to raise_error "Airport is full"
  end
end
