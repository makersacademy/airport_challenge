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
    fail "No space available" if full?
    plane
    @hangar << plane
  end

  def take_off(plane)
    @hangar.pop
    plane
  end

  def weather_take_off(takeoff) 
      if @weather == "stormy"
        raise "cannot takeoff due to stormy weather"
      else
        @hangar.pop
        plane
      end
  end

  def weather_land(land)
    if @weather == "stormy"
      raise "cannot land plane due to stormy weather"
    else
      @hangar << plane
    end
  end


  private
  def full?
    @hangar.length >= capacity
  end

  def empty?
    @hangar.length <= 0
  end

end
