class Plane

  attr_reader :landed

  def initialize
    @flying = true
    @landed = false
  end

  def land airport
    @landed = true
  end

  def flying?
    @flying
  end

  def landed?
    @landed
  end

end
