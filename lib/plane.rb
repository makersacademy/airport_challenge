class Plane
  attr_reader :landed
  alias_method :landed?, :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end
end
