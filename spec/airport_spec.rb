require 'airport'

describe Airport do

it 'instructs a plane to land' do
  plane = Plane.new
  airport = Airport.new("clear")
  airport.land(plane)
  expect(airport.planes_in_airport[0]).to eq plane
end

it 'instructs plane to take off' do
  plane = Plane.new
  airport = Airport.new("clear")
  airport.land(plane)
  airport.take_off(plane)
  expect(airport.planes_in_airport.empty?).to eq true
end

it 'reports that a plane has taken off' do
  plane = Plane.new
  airport = Airport.new("clear")
  airport.land(plane)
  airport.take_off(plane)
  expect(airport.report(plane)).to eq true
end

it 'prevents takeoff in stormy weather' do

  plane = Plane.new
  airport = Airport.new("clear")
  airport.land(plane)
  airport.weather = "stormy"
  airport.take_off(plane)
  expect(airport.report(plane)).to eq false
end

it 'prevents landing in stormy weather' do
  plane = Plane.new
  airport = Airport.new("stormy")
  airport.land(plane)
  expect(airport.report(plane)).to eq true 
end

end
