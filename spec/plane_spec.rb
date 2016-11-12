require 'plane'

describe Plane do
  it "should create a new object" do
    expect(subject).to be_a(Object)
  end

  it "should contain a has_landed method" do
    expect(subject).to respond_to(:has_landed)
  end
  it "should have a default value of not landed" do
    expect(subject.has_landed).to eq false
  end
  it "should return true if a plane has landed" do
    subject.has_landed = true
    expect(subject.has_landed).to eq true
  end
  it "should land at an airport" do
    airport = Airport.new
    expect(subject.land(airport)).to eq true
  end
  it "should take off from an airport" do
    airport = Airport.new
    expect(subject.take_off(airport)).to eq true
  end
  it "shouldn't land if the airport is full" do
    airport = Airport.new
    airport.weather = "sunny"
    20.times {Plane.new.land(airport)}
    subject.land(airport)
    expect(airport.planes.count).to be 20
  end

end
