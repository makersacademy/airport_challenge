require 'plane'

class Airport

  attr_reader :plane

  def port_plane(plane)
    @plane = plane
  end

  def release_plane
    @plane = nil
  end

end

# #FEATURETEST
# heathrow = Airport.new
# require './lib/plane.rb'
#
# boeing = Plane.new
# boeing.land(heathrow)
# boeing.take_off(heathrow) # => when stormy return error "Cannot take off - unsuitable weather conditions"
