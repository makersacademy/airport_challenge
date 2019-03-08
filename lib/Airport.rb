class Airport

  def land(plane)
    @planes = plane
    return "Plane landed"
  end

  def planes
    return @planes
  end

  def take_off(plane)
    if @planes == plane
      @planes = nil
      return "Successful take off"
    end
    raise "That plane isn't at the airport"
  end
end
