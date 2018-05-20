require_relative './plane.rb'

class Airport

  attr_accessor :planes, :capacity

  def initialize(capacity = 30)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    run_land_guards
    @planes << plane
    "Your plane has been successfully stored"
  end

  UNDEFINED = Object.new 

  def take_off(plane= UNDEFINED)
    run_take_off_guards(plane)
    release_plane(plane)
  end

  def run_land_guards
    fail "Plane can't land in stormy weather" if stormy?
    fail "Cannot land plane, airport is full" if full?
  end

  def run_take_off_guards(plane)
    fail "That plane is not in this airport" if plane != UNDEFINED && !check_plane(plane)
    fail "No planes available" if @planes.length.zero?
    fail "Plane can't take off in stormy weather" if stormy?
  end

  def release_plane(plane)
    if plane != UNDEFINED && check_plane(plane)
      @planes.delete(plane)
      plane.take_flight
      return plane
    else 
      plane_to_return = @planes[-1] 
      @planes.pop
      return plane_to_return
    end
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

  def notify_plane(plane)
    plane.take_flight
  end
end
