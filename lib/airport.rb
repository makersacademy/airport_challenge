class Airport

  attr_reader :plane_list

  def initialize
    @plane_list = []
  end

  def land(plane)
    plane.land
    @plane_list << plane
  end

  def take_off
    @plane_list.pop
  end
  
end
