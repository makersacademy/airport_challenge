require 'plane'
require 'weather'

class Airport
  attr_accessor :hangar, :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    if weather.stormy? == true
      return "There is a storm, cannot land"
    else hangar << plane
      return "Plane has landed"
    end

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
