require 'plane'
require 'airport'
require 'pry'

describe Plane do
  it "should no longer be flying once landed" do
    airport = Airport.new
    subject.land(airport)
    expect(subject.location).to eq "AIRPORT"
  end

  it "should take off and no longer be at airport" do
    airport = Airport.new
    subject.land(airport)
    subject.take_off(airport)
    expect(subject.location).to eq "AIR"
  end

  it "should not take off if it's stormy" do
    airport = Airport.new
    subject.land(airport)
    airport.report_storm
    subject.take_off(airport)
    expect(subject.location).to eq "AIRPORT"
  end

  it "should not land if it's stormy" do
    airport = Airport.new
    airport.report_storm
    subject.land(airport)
    expect(subject.location).to eq "AIR"
  end

end
