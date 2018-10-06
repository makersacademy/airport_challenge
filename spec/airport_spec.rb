require 'airport'
require 'weather'
require 'plane'
require 'pry'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
    @good_weather = allow(Weather).to receive(:stormy?) { false }
  end

  it "prevents takeoff when weather is stormy" do
    @plane.land(@airport)
    allow(Weather).to receive(:stormy?) { true }
    expect { @plane.takeoff }.to raise_error "Airport is closed"
  end

  it "prevents landing when weather is stormy" do
    allow(Weather).to receive(:stormy?) { true }
    expect { @plane.land(@airport) }.to raise_error "Airport is closed"
  end

  it "prevents landing if airport is full" do
    Airport::DEFAULT_CAPACITY.times { @airport.receive(Plane.new) }
    allow(Weather).to receive(:stormy?) { false }
    expect { @plane.land(@airport) }.to raise_error "Airport is closed"
  end

  it "has a default capacity" do
    expect(@airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

end
