require 'airport'
require 'plane'

describe 'Land a plane in sunny weather' do
  airport = Airport.new
  plane = Plane.new
  plane.land(airport)
end
