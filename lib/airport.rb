require_relative '../lib/weather'
require_relative '../lib/plane'

class Airport
  attr_reader :ramp, :weather, :capacity

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = Weather.new
    @ramp = []
  end

  def land(plane)
    ramp << plane if ready_for_landing(plane)
    plane.location = "ground" # update plane location
    self # return the airport object
  end

  def takeoff(plane)
    ramp.delete(plane) if ready_for_takeoff(plane)
    plane.location = "air"
    self
  end

  def sunny?
    weather.sunny?
  end

  def full?
    capacity <= ramp.count
  end

  def parked?(plane)
    ramp.include?(plane) # check if plane is already parked in the airport
  end

  # checks plane position, airport capacity and weather for landing
  def ready_for_landing(plane)
    raise 'the plane has already parked in the airport' if parked?(plane)
    raise 'the plane is already parked in another airport' if plane.location == "ground"
    raise 'sorry, cannot land as airport has no space' if full?
    raise 'sorry cannot land or take off due to bad weather conditions' unless sunny?

    true
  end
  
  def ready_for_takeoff(plane)
    raise 'the plane is not in the airport' unless parked?(plane)
    raise 'sorry cannot land or take off due to bad weather conditions' unless sunny?

    true
  end
end
