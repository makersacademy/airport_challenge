require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail("Unable to land due to stormy weather") if weather

    @planes << plane
  end

  def take_off(plane)
    fail("Unable to take off due to stormy weather") if weather

    @planes.delete(plane)
  end

  def weather
    stormy?
  end

  def stormy?
    return true if rand(1..10) > 8
  end

end
