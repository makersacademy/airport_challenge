require "plane"
require "weather"

class Airport
  attr_accessor :capacity, :planes

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def airport_capacity(*)
    @capacity
  end

  def land_in_airport(plane)
    fail "Airport is full" if full?
    fail "Due to stormy weather, plane cannot currently land in airport" if @weather.bad_weather?
    @planes << plane
    end

  def leave_airport
    fail "Due to stormy weather, plane cannot take off" if @weather.bad_weather?
    @planes.pop
  end

  private

  def full?
    @planes.count >= capacity
  end

  def planes_in_airport
    @planes
  end
end
