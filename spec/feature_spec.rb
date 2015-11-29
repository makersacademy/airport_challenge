require 'plane'
require 'airport'

describe 'Feature: ' do

  let(:plane) { Plane.new }
  let(:empty_airport) { Airport.new }
  
  storm_seed = (1..100).select{|n| srand(n); rand(20) == 0 }[0]
  sun_seed = storm_seed - 1

end
