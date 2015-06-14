class Plane

  attr_accessor :flying
  attr_accessor :landed

  def initialize
    @flying = true
    @landed = false
  end

  def flying?
    flying
  end

  def landed?
    landed
  end

  def landing
    self.flying = false
    self.landed = true
  end

  def take_off
    self.flying = true
    self.landed = false
  end
end
