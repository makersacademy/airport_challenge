require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    landing_fail(plane)
    plane.land
    hangar << plane
  end

  def take_off(plane)
    take_off_fail(plane)
    plane.depart
    hangar.delete(plane)
  end

  def full?
    hangar.size >= capacity
  end

  def present?(plane)
    hangar.include?(plane)
  end

  def stormy?
    weather.stormy?
  end

  def landing_fail(plane)
    fail "Airport full" if full?

    fail "Plane already landed" if present?(plane)

    fail "Landing aborted due to stormy weather" if stormy?

  end

  def take_off_fail(plane)
    fail "Plane not at this airport" unless present?(plane)

    fail "Take off aborted due to stormy weather" if stormy?

  end

#  private

  attr_reader :weather, :hangar

end
