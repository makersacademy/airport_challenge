class Plane

  PLANE_IS_FLYING_ERR = "Plane is already in the air.".freeze
  PLANE_IS_ON_LAND_ERR = "Plane is already on the tarmac".freeze

  def initialize
    @flying = true
  end

  def take_off
    raise PLANE_IS_FLYING_ERR if flying?
    @flying = true
    self
  end

  def land
    raise PLANE_IS_ON_LAND_ERR unless flying?
    @flying = false
    self
  end

  def flying?
    @flying
  end

end
