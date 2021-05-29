require_relative 'airport'

class Plane
  attr_reader :status

  def land_at(airport)
    fail "Unable to land, the airport is full!" if airport.full
    @status = "landed"
  end

  def take_off
    @status = "flying"
  end
end