require_relative 'air_traffic_control'

class Airport
  include AirTrafficControl

  DEFAULT_CAPACITY = 50

  attr_accessor :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def gone?(plane)
    planes.none?(plane)
  end

  def request_landing
    capacity_guard
  end

  def request_take_off(plane)
    airport_guard(plane)
  end

  private

  def full?
    planes.count >= capacity
  end
end
