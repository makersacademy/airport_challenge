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
# require './lib/weather.rb'
#
# boeing = Plane.new
# boeing_2 = Plane.new
# boeing.land(heathrow)
# boeing_2.land(heathrow) # => expect error
