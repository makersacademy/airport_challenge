class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    p is_landed?
    fail 'Plane already landed' unless is_landed? != true
    @landed = true
  end

  def take_off
    fail 'Plane already taken off' unless is_landed? != false
    @landed = false
  end

  def is_landed?
    @landed
  end
end
