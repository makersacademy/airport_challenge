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
# require './lib/plane.rb'
# require './lib/weather.rb'
#
# boeing = Plane.new
# boeing.land(heathrow)
# boeing.land(heathrow) # => should raise error
# boeing.take_off(heathrow)
# boeing.take_off(heathrow) # => should raise error
