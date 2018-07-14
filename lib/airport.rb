class Airport

  DEFAULT_CAPACITY = 20

  # initialize is called automatically everytime you use .new
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  attr_reader :capacity
  attr_reader :planes

  def takeoff
    fail 'No planes available' if empty?
    fail 'Weather is stormy' if stormy?
    @planes.pop
    return 'successful takeoff'
  end

  def landing(plane)
    fail 'No bays available' if full?
    fail 'Weather is stormy' if stormy?
    @planes << plane
    return 'successful landing'
  end

  def stormy?
    !!(rand(1..17) > 16)
  end


  def full?
    !!(@planes.size >= @capacity)
  end

  def empty?
    !!(@planes.empty?)
  end

  def bay_available?
    !!(@capacity < @planes.size)
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
