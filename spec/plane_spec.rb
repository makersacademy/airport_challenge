require "plane"

describe Plane do

  it "should return true if a plane is landed" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.landed).to be true
  end

  it "lands at an airport" do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  #it "should return false if a plane is in the air" do
  #  expect(subject.landed?).to be false
  #end
end
