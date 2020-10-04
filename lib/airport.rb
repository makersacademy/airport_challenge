require 'plane.rb'
require 'weather.rb'

class Airport
  attr_reader :bunker, :capacity, :weather
  DEFAULT_CAPACITY = 125

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @bunker = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    return raise "Do not land, airport is full" if full?

    return raise "Plane has already landed" if (plane.flying == false)

    return raise "Arrival delayed: stormy weather" if @weather.stormy?

    plane.arrived
    @bunker << plane
  end

  def takeoff(plane)
    return raise "Departure delayed: stormy weather" if @weather.stormy?
    
    return raise "Plane has taken off" if (plane.flying == true)

    if (plane.flying == false) && !bunker.include?(plane)
      raise "Plane not grounded at this airport"
    end

    plane.departed
    bunker.delete(plane)
    "Flight has departed"
  end

  private
  def full?
    @bunker.length >= @capacity
  end

  def empty?
    @bunker.empty?
  end

end
