class Plane
  def initialize
    @landed = false
  end

  def landed?
    landed
  end

  def land
    self.landed = true
  end

  def take_off
    self.landed = false
  end

  private 

  attr_accessor :landed
end
