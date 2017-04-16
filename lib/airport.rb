require './lib/plane'
require './lib/weather'

class Airport
  include Weather

  attr_accessor :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land_plane(plane)
    planes_in_airport << plane
    "#{plane} has successfully landed"
  end

  def take_off_plane(plane)
    planes_in_airport.pop
    "#{plane} has successfully taken-off"
  end

end
