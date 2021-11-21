require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def take_off_from(airport)
    raise "Plane not in airport hangar. Cannot take off!" unless airport.is_holding?(self)
    raise "Stormy Weather. Cannot take off!" unless airport.weather_ok?
    airport.remove_from_hangar(self)
    @flying = true
  end

  def land_at(airport)
    raise "Plane already in airport hangar. Cannot land plane!" if airport.is_holding?(self)
    raise "Airport full. Cannot land plane!" if airport.hangar_full?
    raise "Stormy Weather. Cannot land plane!" unless airport.weather_ok?
    airport.add_to_hangar(self)
    @flying = false
  end

  def in_airport?(airport)
    airport.hangar.include?(self)
  end

end