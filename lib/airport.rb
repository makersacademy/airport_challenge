require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def permission_to_land(plane)
    taxi_to_hangar(plane)
    'Safe to land'
  end

  def permission_to_takeoff(plane)
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
end
