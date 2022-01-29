
class Plane

  PLANE_IS_ALREADY_FLYING_ERROR = "Plane is already in the air."
  PLANE_IS_ON_LAND_ERROR = "Plane is already on the tarmac"

  def initialize
    @flying = false
  end

  def take_off
    raise PLANE_IS_FLYING_ERROR if flying?
    @flying = true
  end

  def land
    raise PLANE_IS_ON_LAND_ERROR unless flying?
    @flying = false
  end

  def flying?
    @flying
  end

end
