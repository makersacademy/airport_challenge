require 'weather_checker'

class Airport
  AIRPORT_AT_CAPACITY_ERROR = "The airport is full. Plane can not land."

  attr_reader :landed, :capacity, :weather_checker

  def initialize(capacity, weather_checker)
    @landed = []
    @capacity = capacity
    @weather_checker = weather_checker
  end

  def land(flying_object)
    raise AIRPORT_AT_CAPACITY_ERROR if at_capacity?

    raise 'Plane cant take off due to stormy weather' if weather_checker.is_stormy?

    landed.push(flying_object)
    flying_object
  end

  private

  def at_capacity?
    landed.count >= capacity
  end
end
