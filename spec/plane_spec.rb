require "plane"

describe Plane do

  it "should return true if a plane is landed" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.landed).to be true
  end

  it "should land at an airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  it "should take off when taxied from airport" do
    airport = Airport.new
    allow(airport).to receive(:sunny?).and_return(true)
    airport.taxi(subject)
    expect(subject.landed).to be false
  end
end
