require 'plane_class.rb'
require 'airport_class.rb'

describe Airport do
   subject(:airport){Airport.new}
   test_plane = Plane.new

it 'plane lands at airport and confirms landing' do
  airport.land_plane
  expect(airport.airport_has_plane?).to be_truthy
end

end
