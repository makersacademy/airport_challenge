class Plane
attr_accessor :landed

  def initialize(landed = false)
    @landed = landed
  end

  def landing(landed)
    landed = true
  end
end
