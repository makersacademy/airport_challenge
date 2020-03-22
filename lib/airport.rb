require './lib/plane'

class Airport
  attr_reader :plane

  def take_off
    #have done this as a puts but wonder if I should put this in it's own method?
    puts "Plane has left the airport"
    Plane.new
  end

  def land(plane)
    fail "Aiport full, cannot land!" if @plane
    @plane = plane
  end


  #technically below is the attribute reader
  #def plane
  #  @plane
  #end
end
=begin
    hangar = "empty"
    if hangar == "full"
      raise "Airport full, cannot land"
    # end
    end
=end
