require_relative 'plane'

class Airport
  attr_accessor :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 5

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = 'Sunny'
  end

  def takeoff(plane)
    weather_calc(plane)
    parked_here?(plane)
    empty?
    plane.takeoff
    @planes.delete(plane)
  end

  def land(plane)
    weather_calc(plane)
    flying?(plane)
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
    if rand(20) > 17
      fail "Planes cannot take off due to stormy weather" if plane.ground
      fail "Planes cannot land due to stormy weather" if !plane.ground
    end
  end

  def parked_here?(plane)
    fail "That plane is not at this airport" if !@planes.include?(plane) && !@planes.empty?
  end

  def flying?(plane)
    fail "This plane is not in the air" if plane.ground
  end
end
