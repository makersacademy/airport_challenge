require 'plane'

describe Plane do

  it "can create a new plane" do
    expect(Plane.new).to be_a(Plane)
  end

  it "can land at an airport" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    plane.land(airport)

    expect(airport.landed_planes.first.is_landed?).to eq true
  end

  it "can take off from an airport" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    plane.land(airport)
    plane.take_off(airport)

    expect(plane.is_flying?).to eq true
  end

  it "is no longer at an airport after take-off" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    plane.land(airport)
    plane.take_off(airport)

    expect(airport.landed_planes.size).to eq 0
  end

  it "cannot take off if the weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine", "stormy")

    plane.land(airport)
    plane.take_off(airport)

    expect(airport.landed_planes).to include plane
  end

  it "cannot land if the weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("stormy")

    plane.land(airport)

    expect(airport.landed_planes.size).to eq 0
  end

  it "cannot land if the airport is full" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    10.times { plane.land(airport) }

    expect(plane.land(airport)).to eq false
  end

  it "can only take off from an airport it is in" do
    plane = Plane.new
    airport = Airport.new
    wrong_airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    plane.land(airport)

    expect(plane.take_off(wrong_airport)).to eq false
  end

  it "cannot take off if already flying" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    expect(plane.take_off(airport)).to eq false
  end

  it "cannot land if already landed" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    plane.land(airport)

    expect(plane.land(airport)).to eq false
  end

  it "is in an airport when landed" do
    plane = Plane.new
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    plane.land(airport)

    expect(plane.location).to eq airport
  end

end
