require_relative 'plane'
require_relative 'weather'
class Airport
  include Weather
  AIRPORT_CAPACITY = 10
  attr_accessor :capacity
  attr_accessor :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    return "plane already in this airport" if @planes.include?(plane)

    return "plane already landed" if plane.flying == false

    return "airport full" if @planes.length >= @capacity

    return "weather too stormy to land" if stormy?

    @planes << plane
    plane
  end

  def take_off(plane)
    return "plane not in this airport" unless @planes.include?(plane)

    return "plane already flying" if plane.flying == true

    return "weather too stormy to take off" if stormy?

    @planes.delete(plane)
    plane
  end

  def confirm_take_off(plane)
    "#{plane} is no longer in the airport"
  end

end
