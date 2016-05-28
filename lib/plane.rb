class Plane

  attr_accessor :landed

  def initialize
    # assuming plane is landed when created
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end

end
