require 'plane'
require 'airport'

describe Plane do
  plane1 = Plane.new
  airport = Airport.new

  it "plane lands at an airport when instructed" do
    plane1.land(airport)
    expect(plane1.current_airport).to eq airport
  end

  it 'plane takes off from airport and confirms it is no longer in airport' do
    plane1.take_off
    expect(plane1.in_flight).to eq true
    expect(plane1.current_airport). to eq nil
  end
end