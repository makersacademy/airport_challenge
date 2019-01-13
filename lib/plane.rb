class Plane
  attr_reader :landed

  def initialize
    @landed = nil
  end

  def make_land(state)
    @landed = state
  end

end
