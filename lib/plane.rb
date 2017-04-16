class Plane
  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def takeoff
    raise 'Already flying' unless landed?
    @landed = false
  end

  def land
    raise 'Already landed' if landed?
    @landed = true
  end
end
