require 'airport'
require 'plane'
require 'weather'

describe 'Land a plane in sunny weather' do

  weather = Weather.new
  airport = Airport.new
  Airport::DEFAULT_CAPACITY.times{
    plane = Plane.new
    plane.land(airport)
  }

end
