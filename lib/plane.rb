class Plane
  def initialize
    @landed = nil
  end

  def land
    raise 'Plane already landed' if landed?
    self.landed = true
  end

  def take_off
    raise 'Plane already flying' if flying?
    self.landed = false
  end

  private 

  attr_accessor :landed

  def landed?
    landed
  end

  def flying?
    !landed && !landed.nil?
  end
end
