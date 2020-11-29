require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_reader :capacity, :hangar
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new.generate)
    @hangar = [Plane.new]
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "No space available" if full?

    @hangar << plane
  end

  def take_off(plane)
    weather_take_off(plane)
  end

  def weather_take_off(plane) 
    (raise "Cannot take off due to stormy weather" if @weather == "stormy")
    @hangar.pop
    plane
  end

  def weather_land(plane)
    (raise "Cannot land plane due to stormy weather" if @weather == "stormy")
    @hangar << plane
  end

  private
  def full?
    @hangar.length >= capacity
  end

  def empty?
    @hangar.length <= 0
  end

end
