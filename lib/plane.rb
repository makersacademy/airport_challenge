class Plane
  attr_accessor :landed

  def initialize(landed = false)
    @landed = landed
  end

  def landed?
    @landed
  end

end
