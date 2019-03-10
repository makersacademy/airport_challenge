require 'plane'

class Airport
  attr_reader :hangar, :weather

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Landed"
  end

  def take_off(plane)
    @hangar.delete(plane)
    case @weather
    when "stormy" then "Stormy weather: Take off denied" 
    when "sunny"
      @hangar.delete(plane)
      confirm_take_off(plane) 
      "Plane has taken off"
    else 
      "Plane has not taken off"
    end
  end

  def set_weather(type)
    @weather = type
  end

  private

  attr_writer :weather

  def confirm_take_off(plane)
    @hangar.include?(plane)
  end
end
