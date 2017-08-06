require_relative '../lib/airport'

describe Airport do
  subject { described_class.new }

  it "Lets plane land in airport" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "Allows plane to take off from airport" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  # it "Confirms plane has left the airport" do
  #   expect()

  it "Confirm plane has left airport" do
    plane = Plane.new
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { false }
    airport.land_plane(plane)
    expect(airport.take_off(plane)).to eq("#{plane} has left the airport") 
  end

  it "Plane can't land in stormy weather" do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { true }
    plane = Plane.new
    expect { airport.land_plane(plane) }.to raise_error "Weather is too stormy to land"
  end

  it "Plane can't take off in stormy weather" do
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { true }
    plane = Plane.new
    expect { airport.take_off(plane) }.to raise_error "Weather is too stormy to take off"
  end

  it "Airport is full" do
    plane = Plane.new
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { false }
    airport.capacity.times { airport.land_plane(plane) }
    expect { airport.land_plane(plane) }.to raise_error "Airport is full"
  end

  it "Sets a default capacity of 2 when not otherwise specified" do
    expect(Airport.new.capacity).to eq 2
  end
  
  it "Default capacity can be overridden and set by System Designer" do
    expect(Airport.new(5).capacity).to eq 5
  end

  it "Airport is empty" do
    plane = Plane.new
    airport = Airport.new
    allow(airport.weather).to receive(:stormy?) { false }
    expect { airport.take_off(plane) }.to raise_error "There are no planes at this airport"
  end
  

end
 