WEATHER = ["Sunny", "Stormy"]
DEFAULT_CAPACITY = 20

class Airport
  attr_reader :departure
  attr_accessor :weather, :max_capacity, :landing_strip

  def initialize(landing_strip = [Plane.new], max_capacity = DEFAULT_CAPACITY)
    @landing_strip = landing_strip
    @max_capacity = max_capacity
  end

  def land(plane)
    fail 'Sorry, no room' if @landing_strip.length == @max_capacity
    fail 'Sorry, too stormy' if WEATHER.sample == "Stormy"
    # plane.status = "landed"
    @landing_strip << plane
    "Safely landed"
  end

  def take_off(plane = landing_strip.last)
    fail 'Sorry, too stormy' if WEATHER.sample == "Stormy"
    fail 'Already in the air' if plane.flying?
    @departure = @landing_strip.pop
    departure.flying = true
    "flight number #{departure} is no longer at the airport"
  end

  def flying?
    @flying
  end

end

class Plane
  attr_accessor :flying

  def initialize
    @flying = false
  end

  def flying?
    @flying
  end

end
