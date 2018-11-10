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
    fail 'Sorry, too stormy' if stormy?
    fail 'Can not land plane: Plane is already on the ground' unless plane.flying?
    plane.flying = false
    @landing_strip << plane
    "Safely landed"
  end

  def take_off(plane = landing_strip.last)
    fail 'Sorry, too stormy' if stormy?
    fail 'Can not take off: Plane is in the air' if plane.flying?
    fail 'Can not take off: Plane is not at the airport' unless plane_at_terminal?(plane)
    @departure = @landing_strip.pop
    @departure.flying = true
    "flight number #{departure} is no longer at the airport"
  end

  def stormy?
    WEATHER.sample == "Stormy"
  end

  def plane_at_terminal?(plane)
    @landing_strip.include?(plane)
  end

end

class Plane
  attr_accessor :flying

  def initialize(flying = false)
    @flying = flying
  end

  def flying?
    @flying
  end

end
