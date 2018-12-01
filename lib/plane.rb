class Plane

  def initialize (origin, destination, plane_state)
    @origin = origin
    @destination = destination
    @plane_state = plane_state

  end

  def flying?
    return true if @plane_state == "flying"
  end

  def landed?
    return true if @plane_state == "landed"
  end

end
