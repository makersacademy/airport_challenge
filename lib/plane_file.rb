require 'airport'

class Plane

  attr_reader :plane_is_landed


  def initialize(plane_is_landed = false)
    @plane_is_landed = plane_is_landed
  end

  def proceed_to_land(airport_name)
    airport_name.accept_plane(self)
    @plane_is_landed = airport_name.landed?(self)
  end

  def takeoff_from(airport_name)
    fail 'Plane is not at this airport' unless airport_name.landed?(self)
    airport_name.takeoff(self)
    @plane_is_landed = airport_name.landed?(self)
  end
end
