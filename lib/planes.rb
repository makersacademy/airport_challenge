class Planes # Responcible of creating new planes
  attr_accessor :plane_sign

  def initialize(plane_sign = "plane0")
    @plane_sign = plane_sign
  end
end
