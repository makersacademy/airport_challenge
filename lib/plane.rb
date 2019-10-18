class Plane
  attr_accessor :airport_landed_at

  def initialize
    @airport_landed_at = nil
  end

  def land_at(airport)
    airport.planes << self

    @airport_landed_at = airport
  end

  def take_off
    position = @airport_landed_at.get_permission_to_take_off(self)

    raise "Denied permission to take off" if position.nil?

    @airport_landed_at.planes.delete_at(position)
    @airport_landed_at = nil
  end
end
