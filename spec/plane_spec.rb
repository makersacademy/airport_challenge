require 'plane'
require 'airport'
require 'pry'

describe Plane do
  it "should no longer be flying once landed" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.location).to eq "AIRPORT"
  end

  it "should allow the plane to take off and no longer be at airport" do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.location).to eq "AIR"
  end

end
