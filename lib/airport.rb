require_relative 'plane'
DEFAULT_CAPACITY = 100
class Airport

  attr_reader :planes
  attr_accessor :capacity, :weather

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = :sunny
  end

  def accept(plane)
    #weather
    raise "Airport at capacity!  You can not land here!" if over_capacity?
    plane.land
    planes.push(plane)
    plane
  end

  def allow_take_off
    weather
    raise "You can not take off!  The weather is stormy!" if weather == :stormy
    raise "There are currently no planes ready for take off." if no_planes_available?
    plane = planes.pop
    plane.fly
    plane
  end

  private

  def over_capacity?
    planes.count >= capacity
  end

  def no_planes_available?
    planes.empty?
  end

  def weather
    weather = :stormy if Random.rand(100) > 85
  end
end
