require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail("Unable to land as plane as isnt flying") if plane.location != "flying"
    fail("Unable to land due to stormy weather") if weather
    fail("Unable to land due airport capacity being full") if capacity_full

    plane.location = self
    @planes << plane
  end

  def capacity_full
    @planes.length == @capacity
  end

  def take_off(plane)
    fail("Unable to take off as plane isn't in airport") if plane.location != self
    fail("Unable to take off due to stormy weather") if weather

    plane.location = "flying"
    @planes.delete(plane)
  end

  def weather
    stormy?
  end

  def stormy?
    return true if rand(1..5) > 4
  end

end
