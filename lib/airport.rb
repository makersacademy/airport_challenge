require 'plane'
require 'weather'

class Airport
  attr_reader :hangar, :weather, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    "Plane already in hangar" if hangar.include?(plane) == true
    "There is a storm, cannot land" if weather.stormy? == true
    "Hangar is full, cannot land" if hangar.length > capacity
    hangar << plane
    "Plane has landed"
  end

  def take_off(plane)
    "Error: Plane is not in hangar" if hangar.include?(plane) == false
    "There is a storm, can't take off" if weather.stormy? == true
    hangar.delete(plane)
    "Plane has taken off"
  end

end
