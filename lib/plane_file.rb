require 'airport'

class Plane
  def proceed_to_land(airport_name)
    airport_name.accept_plane(self)
    @plane_is_landed = true
  end
end
