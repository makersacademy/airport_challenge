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
    raise "The airport is full" if @planes.length >= @capacity
  end

  def empty?
    raise "There are no planes at the airport" if @planes.empty?
  end

  def weather_calc(plane)
    if rand(20) > 17
      @weather = 'Stormy'
    else
      @weather = 'Sunny'
    end
    raise "Planes cannot take off due to stormy weather" if @weather == "Stormy" && plane.ground
    raise "Planes cannot land due to stormy weather" if @weather == "Stormy" && !plane.ground
  end
end
