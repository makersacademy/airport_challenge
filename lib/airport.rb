require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def permission_to_land(plane)
    full?
    weather_conditions
    taxi_to_hangar(plane)
    'Safe to land'
  end

  def permission_to_takeoff(plane)
    weather_conditions
    clear_for_takeoff(plane)
    "You are clear for take off"
  end

  private

  def taxi_to_hangar(plane)
    hangar << plane
  end

  def clear_for_takeoff(plane)
    hangar.delete(plane)
  end

  def weather_conditions
    raise 'unsafe weather conditions' unless clear?
  end

  def full?
    raise 'Airport full' if hangar.length >= capacity
  end
end
