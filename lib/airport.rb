require 'plane'
require 'weather'

class Airport
  attr_reader :hangar
  attr_accessor :weather

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Landed"
  end

  def takeoff(plane)
    case assign_random_weather
    when :stormy then takeoff_message(:stormy)
    when :sunny
      remove_plane(plane)
      confirm_take_off(plane) ? takeoff_message(:sunny) : plane_has_not_left
    end

  end

  private

  def confirm_take_off(plane)
    @hangar.include?(plane) ? false : true
  end

  def assign_random_weather
    @weather ||= Weather.new
  end

  def remove_plane(plane)
    @hangar.delete(plane)
  end

  def takeoff_message(weather_type)
    weather_type == :sunny ? plane_flying : plane_grounded
  end

  def plane_flying
    "Plane has taken off" 
  end

  def plane_grounded
    "Stormy weather: Take off denied" 
  end

  def plane_has_not_left
    "Plane has not take off yet"
  end
end
