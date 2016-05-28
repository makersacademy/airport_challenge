class Plane

  def initialize
    # assuming plane is landed when created
    @landed = true
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end

end
