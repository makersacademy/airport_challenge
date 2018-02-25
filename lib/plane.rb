class Plane
  attr_accessor :plane_status

  def initialize(status = "flying")
    @plane_status = status
  end
end
