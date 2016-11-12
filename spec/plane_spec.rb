require "plane"

describe Plane do

  it "should return true if a plane is landed" do
    airport = Airport.new
    subject.landed = false
    allow(subject).to receive(:sunny?).and_return(true)
    subject.land(airport)
    expect(subject.landed).to be true
  end

  it "should land at an airport" do
    airport = Airport.new
    subject.landed = false
    allow(subject).to receive(:sunny?).and_return(true)
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  it "should take off when taxied from airport" do
    airport = Airport.new
    allow(airport).to receive(:sunny?).and_return(true)
    airport.taxi(subject)
    expect(subject.landed).to be false
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
    subject.landed = false
    subject.land(airport1)
    expect{subject.land(airport2)}.to raise_error("Already landed at another airport")
  end
end
