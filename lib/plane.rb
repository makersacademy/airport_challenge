class Plane

  attr_reader :landed

  def initialize
    @flying = true
  end

  def land airport
    landed?
  end

  def flying?
    @flying
  end

  def landed?
    @landed = true
  end

end
