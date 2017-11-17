# holds the state of a plane
class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def flying?
    !@landed
  end

  def landed?
    @landed
  end

  def land
    @landed = true
    self
  end

  def take_off
    @landed = false
    self
  end
end
