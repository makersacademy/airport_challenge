require_relative 'plane'

class Airport
  attr_accessor :capacity
  attr_reader :planes, :weather

  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = 'Sunny'
  end

  def takeoff(plane)
    weather_calc(plane)
    empty?
    plane.takeoff
    @planes.delete(plane)
  end

  def land(plane)
    weather_calc(plane)
    full?
    plane.land
    @planes << plane
  end

  private
  def full?
    fail "The airport is full" if @planes.length >= @capacity
  end

  def empty?
    fail "There are no planes at the airport" if @planes.empty?
  end

  def weather_calc(plane)
    @weather = if rand(20) > 17
      'Stormy'
    else
      'Sunny'
    end
    if @weather == "Stormy" && plane.ground
      fail "Planes cannot take off due to stormy weather"
    elsif @weather == "Stormy" && !plane.ground
      fail "Planes cannot land due to stormy weather"
    end
  end
end
