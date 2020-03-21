require './lib/plane'

class Airport
  def take_off
    #have done this as a puts but wonder if I should put this in it's own method?
    puts "Plane has left the airport"
    Plane.new
  end

  #def plane_left_hangar
  #  "Plane has left the airport"
  #end

end
