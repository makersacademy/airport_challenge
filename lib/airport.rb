require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :hangar
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    capacity_for_landing
    forecast_for_landing
    hangar << plane
    plane.landed!
  end

  def instruct_take_off(plane)
    forecast_for_take_off
    hangar.delete(plane)
    plane.take_off!
  end

  def capacity_for_landing
    raise "Hangar capacity at maximum, please continue to circle" if full?
  end

  def forecast_for_landing
    raise "Storms persist, please continue to circle" unless good_weather?
  end

  def forecast_for_take_off
    raise "Storms persist, take-off is delayed" unless good_weather?
  end

  def full?
    landed_planes_total >= @capacity
  end

  def landed_planes_total
    hangar.length
  end
end
