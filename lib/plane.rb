require_relative 'airport'

class Plane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def take_off_from(airport)
    airport.remove_from_hangar(self)
    @flying = true
  end

  def land_at(airport)
    airport.add_to_hangar(self)
    @flying = false
  end


  def in_airport?(airport)
    airport.hangar.include?(self)
  end

end