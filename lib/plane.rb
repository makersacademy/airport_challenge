class Plane

  def initialize(landed=false)
    @landed = landed
  end

  def landed?
    @landed
  end

  def land
    raise 'Unable to land: plane is already on the ground' if landed?

    @landed = false
  end

end
