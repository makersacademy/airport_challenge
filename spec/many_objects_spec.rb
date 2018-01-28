require 'plane'
require 'airport'

# RSpec feature tests that land and take off a number of planes

describe "Bonus feature test for landing more than 1 plane at the airport" do
  it 'allows to land more than 1 plane' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    allow(airport).to receive(:full?) { false }
    allow(airport).to receive(:tell_weather) { "sunny" }
    plane1.land(airport)
    plane2.land(airport)
    expect(airport.planes_a).to eq [plane1, plane2]
  end
end

describe "Bonus feature test for taking off more than 1 plane from the airport" do
  it 'allows to land more than 1 plane' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    airport.planes_a = [plane1, plane2]
    allow(plane1).to receive(:status) { "at_airport" }
    allow(plane2).to receive(:status) { "at_airport" }
    allow(airport).to receive(:full?) { false }
    allow(airport).to receive(:tell_weather) { "sunny" }
    plane1.take_off(airport)
    plane2.take_off(airport)
    expect(airport.planes_a).to eq []
  end
end
