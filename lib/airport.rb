require 'plane'
require 'weather'

class Airport
  attr_reader :hangar, :weather
  attr_writer :weather

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Landed"
  end

  def takeoff(plane)
    @hangar.delete(plane)
    @weather ||= Weather.new

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

  private

  def confirm_take_off(plane)
    @hangar.include?(plane)
  end
end
