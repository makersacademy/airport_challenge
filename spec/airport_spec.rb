require 'airport'
require 'plane'

describe Airport do

  let(:airport) { Airport.new }
  let(:airport2) { Airport.new }
  let(:plane) { Plane.new }

  it "checks that a plane can land at an airport" do
    airport.stub(:weather) { 0.5 }
    expect(airport.land_plane(plane)).to eq ([plane])
  end

  it "checks that a plane can take off from an airport" do
    airport.stub(:weather) { 0.5 }
    airport.land_plane(plane)
    expect(airport.take_off_plane(plane)).to eq (plane)
  end

  it "checks if the airport is full and prevents landing" do
    airport.stub(:weather) { 0.5 }
    airport.default_capacity.times { airport.land_plane Plane.new }
    expect {airport.land_plane(plane)}.to raise_error
  end

  it "allows the default airport capacity to be overwritten" do
    airport.stub(:weather) { 0.5 }
    airport = Airport.new(86)
    expect(airport.default_capacity).to eq(86)
  end

  it "expects planes to only take off from airports they were at" do
    airport.stub(:weather) { 0.5 }
    airport.land_plane(plane)
    expect{airport2.take_off_plane(plane)}.to raise_error
  end

  it "expects planes that have landed already to not be able to land again" do
    airport.stub(:weather) { 0.5 }
    airport.land_plane(plane)
    expect {airport.land_plane(plane)}.to raise_error
  end

  it "expects planes that have taken off already to not be able to take off again" do
    airport.stub(:weather) { 0.5 }
    airport.land_plane(plane)
    airport.take_off_plane(plane)
    expect {airport.take_off_plane(plane)}.to raise_error
  end

  it "prevents take off from an airport when the weather is stormy" do
    airport.stub(:weather) { 0.5 }
    airport.land_plane(plane)
    airport.stub(:weather) { 0.95 }
    expect {airport.take_off_plane(plane)}.to raise_error "A plane can't take off if the weather is stormy"
  end

  it "prevents landing at an airport when the weather is stormy" do
    airport.stub(:weather) { 0.95 }
    expect {airport.land_plane(plane)}.to raise_error "A plane can't land if the weather is stormy"
  end

end
