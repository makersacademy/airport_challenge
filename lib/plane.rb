class Plane

  def initialize
    @plane_status = status
  end

  def landed(plane_inqired)
    @plane_list << plane_inqired
  end

  def take_off(plane_inqired)
    @plane_list.delete(plane_inqired)
  end

end
