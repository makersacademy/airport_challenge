class Plane
  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  private

  def land
    raise 'Already landed' if landed?
    @landed = true
  end

  def takeoff
    raise 'Already flying' unless landed?
    @landed = false
  end
end
