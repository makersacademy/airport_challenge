class Airport
  def land_plane(plane)
    @plane = plane
  end

  def plane_landed?(plane)
    if @plane == nil
      return false

    else
      return true
    end
  end

  def take_off(plane)
    if @plane == nil
      return true
    end
  end

  def receive_plane(plane)
    raise "plane cannot land when airport is full"
    if @planes.count >= @capacity


  end
end
