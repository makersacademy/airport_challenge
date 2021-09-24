require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Weather is stormy. Landing not permitted." if weather == "stormy"
    @planes << plane
  end

  def takeoff
    raise "Weather is stormy. Takeoff not permitted." if weather == "stormy"
    planes.pop
  end

  def weather
    ["stormy", "sunny"].sample
  end

  private

  def full?
    return true if planes.length >= DEFAULT_CAPACITY
    false
  end
end
