require "plane"

describe Plane do

  it "should return true if a plane is landed" do
    airport = Airport.new
    airport.dock(subject)
    airport.taxi(subject)
    allow(subject).to receive(:sunny?).and_return(true)
    allow(airport).to receive(:sunny?).and_return(true)
    subject.land(airport)
    expect(subject.status).to be true
  end

  it "should land at an airport" do
    airport = Airport.new
    subject.airborne
    allow(airport).to receive(:sunny?).and_return(true)
    allow(subject).to receive(:sunny?).and_return(true)
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  it "should take off when taxied from airport" do
    airport = Airport.new
    allow(airport).to receive(:sunny?).and_return(true)
    airport.dock(subject)
    airport.taxi(subject)
    expect(subject.status).to be false
  end

  it "should not land if stormy weather" do
    airport = Airport.new
    allow(subject).to receive(:sunny?).and_return(false)
    expect{subject.land(airport)}.to raise_error("Too stormy to land")
  end

  it "should only be able to land if not already landed" do
    airport1 = Airport.new
    airport2 = Airport.new
    allow(subject).to receive(:sunny?).and_return(true)
    subject.airborne
    subject.land(airport1)
    expect{subject.land(airport2)}.to raise_error("Already landed at another airport")
  end

  it "two planes should take of from one airport and land at another" do
    plane1 = Plane.new
    plane2 = Plane.new
    airport1 = Airport.new
    airport2 = Airport.new
    airport1.dock(plane1)
    airport1.dock(plane2)
    allow(airport1).to receive(:sunny?).and_return(true)
    airport1.taxi(plane1)
    airport1.taxi(plane2)
    allow(plane1).to receive(:sunny?).and_return(true)
    allow(plane2).to receive(:sunny?).and_return(true)
    plane1.land(airport2)
    plane2.land(airport2)
    expect(airport1.planes.count).to eq(0)
    expect(airport2.planes).to include(plane1)
    expect(airport2.planes).to include(plane2)
  end
end
