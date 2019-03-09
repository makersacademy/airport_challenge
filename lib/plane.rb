class Plane
  attr_accessor :landed

  def initialize(landed = true)
    @landed = landed
  end

  def landed?
    landed
  end

end
