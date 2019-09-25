class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def flying?
    @landed = false
  end

  def landed?
    @landed = true
  end

end
