require 'airport'
require 'plane'

describe Airport do

  describe "#lands_plane"

  it { is_expected.to respond_to(:land_plane) }

  it "lands a plane" do
    airport = Airport.new
    plane = Plane.new
    allow(airport). to receive(:rand).and_return(2)
    expect(airport.land_plane(plane)).to include plane
  end

  it "allows multiple planes to land" do
    airport = Airport.new(5)
    plane1 = Plane.new
    plane2 = Plane.new
    allow(airport). to receive(:rand).and_return(1)
    airport.land_plane(plane1)
    airport.land_plane(plane2)
    expect(airport.planes).to include(plane1, plane2)
  end

  it "prevents landing plane when stormy" do
    airport = Airport.new
    plane = Plane.new
    allow(airport). to receive(:rand).and_return(5)
    expect { airport.land_plane(plane) }.to raise_error "Too stormy to land"
  end

  it "prevents landing a plane when airport full" do
    airport = Airport.new
    plane = Plane.new
    allow(airport). to receive(:rand).and_return(1)
    10.times {airport.land_plane(plane)}
    expect { airport.land_plane(plane) }. to raise_error "Airport full, no space to land"
  end

  describe "#take_off"

  it { is_expected.to respond_to(:take_off) }

  it "takes off a plane" do
    airport = Airport.new
    plane = Plane.new
    allow(airport). to receive(:rand).and_return(1)
    airport.land_plane(plane)
    airport.take_off
    expect(airport.planes).to be_empty
  end

  it "prevents take off when stormy" do
    airport = Airport.new
    allow(airport). to receive(:rand).and_return(5)
    expect { airport.take_off }.to raise_error "Too stormy to take off!"
  end

  it "confirms plane has left airport" do
    airport = Airport.new
    plane = Plane.new
    allow(airport). to receive(:rand).and_return(1)
    airport.land_plane(plane)
    expect(airport.take_off).to eq "plane has left the airport"
  end

  describe "#stormy?"

  it "checks if weather is stormy when rand(1..5) = 5" do
    airport = Airport.new
    allow(airport). to receive(:rand).and_return(5)
    expect(airport.stormy?). to eq true
  end


end
