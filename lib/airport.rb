class Airport
  # initialize is called automatically everytime you use .new
  def initialize
    @airport_bay_capacity = 5 # this is a fixed variable
    # how can you make it accessible from outside? by adding attr_reader below
    @bays_occupied = 0
  end
  attr_reader :bays_occupied
  attr_reader :airport_bay_capacity

  def takeoff(plane)
    @plane = plane
    # show that the plane is able to take off and delete
    if stormy? == false # it is sunny and plane is allowed to takeoff
      return 'successful takeoff' #
    end
  end

  def landing(plane)
    @plane = plane
    # show that the plane is able to land and is present in the landing area
    if stormy? == false # it is sunny and plane is allowed to land
      return 'successful landing'
    end
  end

  def bays_occopied_count
    if takeoff(plane) == 'successful takeoff'
      @bays_occopied_count -= 1
    elsif landing(plane) == 'successful landing'
      @bays_occopied_count += 1
    else
      @bays_occopied_count
    end
  end

  def bay_available?
    # show whether there are available bays for plane to land
    if @bays_occupied = @airport_bay_capacity
      fail 'No bays available to land'
      false
    elsif @bays_occupied > @airport_bay_capacity
      puts 'umm, there are more planes than we have parking spots? CHECK.'
    else
      true
    end
  end

  def stormy?
    # randomize weather from sunny to stormy
    rand(1..17) > 16
  end

end

# IGNORE THIS
#
# require 'plane.rb'
#
# class Airport
#   def land_plane
#     Plane.new
#     # want airport.land(plane) = plane
#     # if plane.able_to_land? = true.
#   end
#
#   def stormy?
#
#   end
# end
