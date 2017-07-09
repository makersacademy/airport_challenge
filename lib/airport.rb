require 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def port_plane(plane)
    @planes << plane
  end

  def release_plane(plane)
    @planes.delete(plane)
  end

end

# #FEATURETEST
# heathrow = Airport.new
# gatwick = Airport.new
# require './lib/plane.rb'
# require './lib/weather.rb'
#
# boeing = Plane.new
# boeing.land(heathrow)
# boeing.take_off(gatwick) # => should be an error
