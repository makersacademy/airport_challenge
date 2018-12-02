class Plane

  def initialize(plane_state)
    @plane_state = plane_state

  end

  attr_accessor :plane_state

  def flying?
    @plane_state == "flying"
  end

  def landed?
    @plane_state == "landed"
  end

end
