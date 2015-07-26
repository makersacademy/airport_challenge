require_relative 'weather'
DEFAULT_CAPACITY = 100
class Airport

  attr_reader :planes
  attr_accessor :capacity, :weather

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def accept(plane)
    if weather_report == "stormy"
      raise "You can not land!  The weather is stormy!"
    elsif over_capacity?
      raise "Airport at capacity!  You can not land here!"
    else
      plane.land
      planes.push(plane)
      plane
    end
  end

  def allow_take_off
    if weather_report == "stormy"
      raise "You can not take off!  The weather is stormy!"
    elsif no_planes_available?
      raise "There are currently no planes ready for take off."
    else
      plane = planes.pop
      plane.fly
      plane
    end
  end

  private

  def over_capacity?
    planes.count >= capacity
  end

  def no_planes_available?
    planes.empty?
  end

  def weather_report
    Random.rand(100) > 85 ? "stormy" : "sunny"
  end
end
