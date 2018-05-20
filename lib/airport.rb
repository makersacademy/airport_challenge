require_relative './plane.rb'

class Airport

  attr_accessor :planes, :capacity

  def initialize(capacity = 30)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane can't land in stormy weather" if stormy?
    fail "Cannot land plane, airport is full" if full?
    @planes << plane
    "Your plane has been successfully stored"
  end

# I'm trying to make it so that if the user entered a plane then check to see if it's
# in the hangar before the guard that fails if there are no planes 

# I would check if the user set a variable, and if they did then I would check if the plane was included in the @planes array 

  UNDEFINED = Object.new 

  def take_off(plane= UNDEFINED)
    if plane != UNDEFINED
      fail "That plane is not in this airport" unless @planes.include?(plane)
    else
      plane = @planes[-1]
    end

    fail "No planes available" if @planes.length.zero?
    fail "Plane can't take off in stormy weather" if stormy?
    plane
    @planes.pop
  end


  def check_plane(plane) 
    @planes.include?(plane) ? true : false
  end

  def stormy? 
    weather_generator >= 75
  end

  def weather_generator
    rand(100)
  end

  def full?
    @planes.length >= @capacity
  end

end
