WEATHER = ["Sunny", "Stormy"]

class Airport
  attr_reader :landing_strip, :departure
  attr_accessor :weather, :max_capacity

  def initialize(max_capacity = 20)
    @landing_strip = []
    @max_capacity = max_capacity
  end

  def land(plane)
    fail 'Sorry, no room' if @landing_strip.length == @max_capacity
    fail 'Sorry, too stormy' if WEATHER.sample == "Stormy"
    @landing_strip << plane
    "Safely landed"
  end

  def take_off
    fail 'Sorry, too stormy' if WEATHER.sample == "Stormy"
    @departure = @landing_strip.pop
    "flight number #{departure} is no longer at the airport"
  end

end

class Plane

  def initialize
    @plane
  end

end
