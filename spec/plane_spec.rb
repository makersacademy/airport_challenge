require 'plane'
require 'airport'

describe Plane do
  it "responds to flying?" do
    expect(subject).to respond_to :flying?
  end

  # it "responds to on_runway?" do
  #   expect(subject).to respond_to :on_runway?
  # end

  it "knows when it's on the runway" do
    plane = Plane.new
    airport = Airport.new
    airport.add_plane(plane)
    allow(airport).to receive(:storm) { false }
    airport.land_plane(plane)
    #  expect(plane.on_runway?).to eq true
    expect(plane.flying?).to eq false
  end

  it "knows when it's in the air" do
    plane = Plane.new
    airport = Airport.new
    airport.add_plane(plane)
    allow(airport).to receive(:storm) { false }
    airport.take_off(plane)
    expect(plane.flying?).to eq true
    #  expect(plane.on_runway?).to eq false
  end

  it "knows when it's been added to an airport" do
    plane = Plane.new
    airport = Airport.new
    airport.add_plane(plane)
    expect(plane.at_airport?).to eq true
    #  expect(plane.on_runway?).to eq false
  end

end
