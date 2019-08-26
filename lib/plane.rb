class Plane
  attr_accessor :state

  def initialize(state = "flying")
    @state = state
  end

  def land
    raise "Plane already landed" if @state == "landed"
    @state = "landed"
  end

  def takeoff
    raise "Plane has already taken off" if @state == "flying"
    @state = "flying"
  end

end
