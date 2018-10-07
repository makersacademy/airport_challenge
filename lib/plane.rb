class Plane
  attr_accessor :onground

  def initialize
    @onground = true
  end
  def landed?
    @onground
  end
  def land
    @onground = true
  end
  def take_off
    @onground = false
  end
end
