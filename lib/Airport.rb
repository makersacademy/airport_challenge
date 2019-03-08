class Airport

  def land(plane)
    @planes = plane
    return "Plane landed"
  end

  def planes
    return @planes
  end
end
