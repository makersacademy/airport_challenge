class Airport

  def initialize
    @plane_list = []
  end

  def land_airplane(plane)
    @plane_list << plane
  end

  def launch_airplane(plane)
    @plane_list.delete(plane)
  end

  def list_airplanes
    @plane_list
  end
end
