require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    return "Error: Plane is already in hangar" if in_hangar?(plane)
    return "Can't land: Airport full" if hangar.length == 5
    return "Can't land: weather stormy" if weather_stormy?
    add_to_hangar(plane)
    return "Plane has landed"
  end

  def take_off(plane)
    return "Error: Plane is not in hangar" unless in_hangar?(plane)
    return "Can't take off: weather stormy" if weather_stormy?
    remove_from_hangar(plane)
    return "Plane has taken off"
  end

  private

  def weather_stormy?
    Weather.new.stormy?
  end

  def add_to_hangar(plane)
    hangar << plane
  end

  def remove_from_hangar(plane)
    hangar.delete(plane)
  end

  def in_hangar?(plane)
    hangar.include?(plane)
  end
end
