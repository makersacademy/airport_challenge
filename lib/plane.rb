class Plane
attr_accessor :landed
DEFAULT_LANDED = true

def initialize(landed = DEFAULT_LANDED)
  @landed = landed
end

  def land
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    @landed = false
  end

end
