class Plane
  def initialize(plane_id, plane_location)
    @id = plane_id
    @location = plane_location
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

  def check_location
    return @location
  end
end
