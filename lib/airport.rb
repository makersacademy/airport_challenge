class Airport
  attr_reader :current_planes, :weather
  
  def initialize(weather = "clear")
    @current_planes = []
    @weather = weather
  end
  
  def land(plane)
    fail "It is too stormy to land" if stormy?
    @current_planes.push(plane)
    plane.set_landed
  end

  def launch
    fail "It is too stormy to launch" if stormy?
    @current_planes.last.take_off
    @current_planes.pop
  end

  def stormy?
    return true if weather == "stormy"
    return false
  end
end
