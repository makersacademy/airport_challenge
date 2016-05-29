require_relative 'weather'

class Airport
  attr_reader :current_planes, :weather, :capacity
  DEFAULT_CAPACITY = 5 
  
  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @current_planes = []
    @weather = weather.current_weather
    @capacity = capacity
  end
  
  def land(plane)
    fail "It is too stormy to land" if stormy?
    fail "Airport is full" if full?
    @current_planes.push(plane)
    plane.set_landed
  end

  def launch
    fail "It is too stormy to launch" if stormy?
    @current_planes.last.take_off
    @current_planes.pop
  end

  def set_weather
    weather = Weather.new
    @weather = weather.current_weather
  end

  private

  def stormy?
    return true if weather == "stormy"
    false
  end

  def full?
    return true if @current_planes.length >= @capacity
    false
  end
end
