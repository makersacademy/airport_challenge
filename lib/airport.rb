require './lib/plane'

class Airport
  attr_reader :plane
  def take_off
    #have done this as a puts but wonder if I should put this in it's own method?

    puts "Plane has left the airport"
    Plane.new
  end

  def land(plane)
    raise "Airport full, cannot land"
    #@plane = plane
    #@plane
  end

end
