class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Plane already landed' unless landed? != true
    @landed = true
  end

  def take_off
    fail 'Plane already taken off' unless landed? != false
    @landed = false
  end

  def landed?
    @landed
  end
end
