require_relative 'weather'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 5 
  
  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @current_planes = []
    @weather = weather.current_weather
    @capacity = capacity
  end
  
  def land(plane)
    land_fail
    @current_planes.push(plane)
    plane.set_landed
  end

  def launch
    launch_fail
    current_planes.last.take_off
    @current_planes.pop
  end

  def set_weather
    new_weather = Weather.new
    @weather = new_weather.current_weather
  end

  def last
    current_planes.last
  end

  private

  attr_reader :weather, :current_planes
  
  def land_fail
    fail "It is too stormy to land" if stormy?
    fail "Airport is full" if full?
  end

  def launch_fail
    fail "It is too stormy to launch" if stormy?
  end

  def stormy?
    return true if weather == "stormy"
    false
  end

  def full?
    return true if current_planes.length >= capacity
    false
  end
end
