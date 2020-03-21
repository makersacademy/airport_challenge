require './lib/plane'

class Airport
  attr_reader :plane

  def take_off
    #have done this as a puts but wonder if I should put this in it's own method?
    puts "Plane has left the airport"
    Plane.new
  end

  def hangar_full
    raise "Airport full, cannot land"
  end


  def land(plane)
    #hangar = "full"
    #if hangar == "full"
    #  hangar_full()
    #else
      @plane = plane
      @plane
    end
  end
#end
=begin
    hangar = "empty"
    if hangar == "full"
      raise "Airport full, cannot land"
    # end
    end
=end
