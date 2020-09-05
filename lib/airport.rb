class Airport

  def land(plane)
    @planes = [plane]
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  def takeoff(plane)
    @planes.delete(plane)
  end
end