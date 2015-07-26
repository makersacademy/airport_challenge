class Plane
  attr_reader :plane_state

  def initialize
    @plane_state = "flying"
  end

  def landed?
    if @plane_state == "landed"
    	return true
    end
  end

  def flying?
    if @plane_state == "flying"
    	return true
    end
  end

  def land
    @plane_state = "landed"
  end

  def take_off
    @plane_state = "flying"
  end

end