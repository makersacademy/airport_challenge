class Plane
  def initialize(plane_id)
    @id = plane_id
  end

  def land
    return true
  end

  def takeoff
    return true
  end

  def check_id
    return @id
  end
end
