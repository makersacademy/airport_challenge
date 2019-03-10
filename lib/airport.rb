require 'plane'
require 'weather'

class Airport
  attr_reader :hangar, :capacity
  attr_accessor :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    case assign_random_weather
    when :stormy then denied_landing_bad_weather
    when :sunny then add_plane_to_hangar(plane)
    end
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

  def add_plane_to_hangar(plane)
    check_if_space_in_hangar ? add_plane(plane) : denied_landing_no_space
  end

  def check_if_space_in_hangar
    @hangar.length < capacity
  end

  def add_plane(plane)
    @hangar << plane
    plane_landed
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

  def plane_landed
    "Landed"
  end
  
  def denied_landing_no_space
    "Landing not possible"
  end

  def denied_landing_bad_weather
    "Stormy weather: landing denied"
  end
end
