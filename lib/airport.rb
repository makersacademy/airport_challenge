require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    if in_hangar?(plane)
      return "Error: Plane is already in hangar"
    elsif weather_stormy?
      return "Can't land: weather stormy"
    else
      add_to_hangar(plane)
      return "Plane has landed"
    end
  end

  def take_off(plane)
    if !in_hangar?(plane)
      return "Error: Plane is not in hangar"
    elsif weather_stormy?
      return "Can't take off: weather stormy"
    else
      remove_from_hangar(plane)
      return "Plane has taken off"
    end
  end

  private

  def add_to_hangar(plane)
    hangar << plane
  end

  def remove_from_hangar(plane)
    hangar.delete(plane)
  end

  def in_hangar?(plane)
    hangar.include?(plane)
  end

  def weather_stormy?
    Weather.new.stormy?
  end

end
