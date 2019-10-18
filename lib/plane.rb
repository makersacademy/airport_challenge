class Plane
  attr_accessor :landed_at

  def initialize
    @landed_at = nil
  end

  def land_at(airport)
    airport.planes << self

    @landed_at = airport
  end

  def take_off
    position = @landed_at.get_permission_to_take_off(self)

    raise "Denied permission to take off" if position.nil?

    @landed_at.planes.delete_at(position)
    @landed_at = nil
  end
end
