class Airport

  def initialize(plane_count: 0)
    @plane_count = plane_count
  end

  def land?
    @plane_count < 5
  end

end
