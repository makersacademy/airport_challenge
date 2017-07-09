require 'plane_class.rb'
require 'airport_class.rb'
require 'weather_class.rb'

describe Airport do
   subject(:airport){Airport.new}
   test_plane = Plane.new

it 'plane lands at airport and confirms landing' do
  airport.land_plane
  expect(airport.airport_has_plane?).to be_truthy
end

it 'plane takes off from airport and confirms this' do
  airport.land_plane
  airport.release_plane
  expect(airport.airport_has_plane?).to be_falsey
end

it 'prevents takeoff during stormy weather' do
  airport.land_plane
  allow(airport).to receive(:weather?) { 'stormy' }
  expect(airport.release_plane).to eq "Takeoff delayed due to bad weather"
end
end
