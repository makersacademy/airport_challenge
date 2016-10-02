class Plane

attr_reader :in_air

  def initialize(plane_name = nil)
    @plane_name = plane_name
    @in_air = true
  end

end
