require 'plane'
require 'weather'

class Airport
  attr_accessor :hangar, :weather, :capacity
  DEFAULT_CAPACITY = 25

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    if weather.stormy? == true
      return "There is a storm, cannot land"
    end
    if hangar.length > capacity
      return "Hangar is full, cannot land"
    end
    hangar << plane
    return "Plane has landed"
  end

  def take_off(plane)

    if hangar.include?(plane) == false
      return "Error: Plane is not in hangar"
    elsif weather.stormy? == true
      return "There is a storm, can't take off"
    else hangar.delete(plane)
      return "Plane has taken off"
    end

  end

end
