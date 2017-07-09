class Plane
  attr_accessor :flying, :landed

  def initialize
    @flying = true
    @landed = false
  end

  def flying?
    @flying
  end

  def landed?
    @landed
  end

end
