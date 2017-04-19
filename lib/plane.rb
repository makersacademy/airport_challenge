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
    "Emergency takeoff."
  end

  def land
    raise 'Already landed' if landed?
    @landed = true
    "Emergency landing outside airport."
  end
end
