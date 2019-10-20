class Plane
attr_reader :landed

def initialize
  @landed = false
end

def plane_landed
  @landed = true
  end

  def plane_flying
    @landed = false
end

def landed?
  @landed
  end
end
