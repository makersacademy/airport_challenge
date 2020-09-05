class Airport

  def initialize
    @capacity = 3
    @current_planes = []
  end

  def land(plane)
    if @capacity <= @current_planes.length
      fail "Airport full"
    else
      @plane_landed = plane
      @current_planes << @plane_landed
    end
  end

  def take_off
  end

  def has_departed
    true
  end

end
