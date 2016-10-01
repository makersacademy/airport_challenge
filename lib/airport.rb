require_relative './plane'
require_relative './weather'


class Airport
  DEFAULT_CAPACITY = 10

  # attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @specified_capacity = capacity
  end

  def landing_slots
    @specified_capacity - @planes.count
  end

  def plane_takeoff
  end

  def plane_land
    conditions.stormy? ? "Unable to land plane in a storm" : @planes << Plane.new
  end

  def conditions
    Weather.new
  end

end
