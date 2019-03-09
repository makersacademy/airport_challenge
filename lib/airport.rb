require 'plane'
require 'weather'

class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
    return "Plane has landed"
  end

  def take_off(plane)

    if hangar.include?(plane) == false
      return "Error: Plane is not in hangar"
    elsif Weather.new.stormy? == true
      return "There is a storm, can't take off"
    else hangar.delete(plane)
      return "Plane has taken off"
    end

  end

end
