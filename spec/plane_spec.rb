require 'plane'
require 'airport'

describe Plane do

  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }
  it "Should land at an airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    subject.land(airport)
    expect(airport.landed_planes[-1]).to eq subject
  end

  it "Should take off from an airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    50.times { airport.landed_planes << Plane.new }
    subject.take_off(airport)
    expect(airport.landed_planes.length).to eq 4
  end

  it "Should return an error if a plane tries to take off but there are no planes at the airport" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    expect { subject.take_off(airport) }.to raise_error("There are no planes in the airport to take off")
  end

  it "Planes should not be allowed to take off if the weather is stormy" do
    airport = Airport.new
    50.times { airport.landed_planes << Plane.new }
    allow(airport).to receive(:stormy?) { true }
    expect { subject.take_off(airport) }.to raise_error("The weather is stormy! No planes can take off at the moment.")
  end

  it "Planes should not be allowed to land if the weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { true }
    expect { subject.land(airport) }.to raise_error("The weather is stormy! No planes can land at the moment.")
  end

  it "Planes should not be able to land at an airport that is full" do
    airport = Airport.new
    allow(airport).to receive(:stormy?) { false }
    100.times { airport.landed_planes << Plane.new }
    expect { subject.land(airport) }.to raise_error("The plane can't land as the airport is full.")
  end

  # it "Planes should not be able to land at another airport if they are already in an airport" do
  #   airport = Airport.new
  #   airport1 = Airport.new
  #   allow(airport).to receive(:stormy?) { false }
  #   allow(airport1).ro receive(:stormy?) { false }
  # end

end
