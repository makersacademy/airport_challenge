class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Plane is on ground!' if @landed
    @landed = true
  end

  def takeoff
    fail 'Plane is already flying!' unless @landed
    @landed = false
  end

end
