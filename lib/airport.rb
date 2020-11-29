require_relative '../lib/weather'
require_relative '../lib/plane'

DEFAULT_CAPACITY = 1

class Airport
  attr_reader :ramp, :weather
  attr_accessor :capacity # made the capacity amendable for feature testing later

  def initialize
    @capacity = DEFAULT_CAPACITY
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

  def good_weather?
    weather.sunny?
  end

  def below_capacity?
    capacity > ramp.count
  end

  def landed?(plane)
    ramp.include?(plane) # check if plane is already landed in the airport
  end

  # checks plane position, airport capacity and weather for landing
  def ready_for_landing(plane)
    raise 'the plane has already landed in the airport' if landed?(plane)
    raise 'the plane is already parked in another airport' if plane.location == "ground"
    raise 'sorry, cannot land as airport has no space' unless below_capacity?
    raise 'sorry cannot land or take off due to bad weather conditions' unless good_weather?

    true
  end
  
  def ready_for_takeoff(plane)
    raise 'the plane is not in the airport' unless landed?(plane)
    raise 'sorry cannot land or take off due to bad weather conditions' unless good_weather?

    true
  end
end
