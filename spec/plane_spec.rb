require 'plane'

describe Plane do

  it "can create a new plane" do
    expect(subject).to be_a(Plane)
  end

  it "can land at an airport" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    subject.land(airport)

    expect(airport.landed_planes.first.is_landed?).to eq true
  end

  it "can take off from an airport" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    subject.land(airport)
    subject.take_off(airport)

    expect(subject.is_flying?).to eq true
  end

  it "is no longer at an airport after take-off" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    subject.land(airport)
    subject.take_off(airport)

    expect(airport.landed_planes.size).to eq 0
  end

  it "cannot take off if the weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine", "stormy")

    subject.land(airport)
    subject.take_off(airport)

    expect(airport.landed_planes).to include subject
  end

  it "cannot land if the weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("stormy")

    subject.land(airport)

    expect(airport.landed_planes.size).to eq 0
  end

  it "cannot land if the airport is full" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    10.times { Plane.new.land(airport) }

    expect(Plane.new.land(airport)).to eq false
  end

  it "can only take off from an airport it is in" do
    airport = Airport.new
    wrong_airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    subject.land(airport)

    expect(subject.take_off(wrong_airport)).to eq false
  end

  it "cannot take off if already flying" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    expect(subject.take_off(airport)).to eq false
  end

  it "cannot land if already landed" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    subject.land(airport)

    expect(subject.land(airport)).to eq false
  end

  it "is in an airport when landed" do
    airport = Airport.new
    allow(airport).to receive(:weather).and_return("fine")

    subject.land(airport)

    expect(subject.location).to eq airport
  end

end
