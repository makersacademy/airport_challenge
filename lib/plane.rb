class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end

end
