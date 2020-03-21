require './lib/plane'

class Airport
  #attr_reader :plane
  def take_off
    #have done this as a puts but wonder if I should put this in it's own method?
    puts "Plane has left the airport"
    Plane.new
  end

  def land
    "plane"
  end

  #def plane_left_hangar
  #  "Plane has left the airport"
  #end

end
