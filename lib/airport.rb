require "set"
require_relative "./weather"

class Airport
  attr_reader :name

  def initialize(capacity = 12, name = "[NAME]", weather = Weather.new)
    @name = name
    @capacity = capacity
    @planes = Set.new
    @weather = weather
  end

  def land(plane)
    # TODO: check full? & stormy? here instead of Plane's land_at method, 
    # raise exeptions if necessary
    @planes.add(plane)
    return "Airport #{@name} has #{@planes.size} out of #{@capacity} planes inside."
  end

  def departure(plane)
    # TODO: check stormy? here instead of Plane's take_off method, raise exeption if necessary
    @planes.delete(plane)
    return "Airport #{@name} has #{@planes.size} out of #{@capacity} planes inside."
  end

  def full?
    @planes.size == @capacity
  end

  def stormy?
    @weather.stormy?
  end

end
