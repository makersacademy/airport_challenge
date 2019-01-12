class Plane

  LANDED_ERROR = 'Unable to land: plane is already on the ground'
  ALREADY_FLYING_ERROR = 'Unable to takeoff: plane is already in the air'

  def initialize(landed = false)
    @landed = landed
  end

  def landed?
    @landed
  end

  def land
    raise LANDED_ERROR if landed?

    @landed = true
  end

  def takeoff
    raise ALREADY_FLYING_ERROR unless landed?

    @landed = false
  end

end
