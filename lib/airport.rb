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
# boeing = Plane.new
# boeing.land(heathrow)
# boeing.landed # => true
# heathrow.plane # => boeing
# boeing.take_off(heathrow)
# boeing.landed # => false
# heathrow.plane # => nil
