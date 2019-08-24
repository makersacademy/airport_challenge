class Airport
  def land_plane(plane)
    plane
  end
end

class Weather
  def stormy?
    return true if rand < 0.1
    false
  end
end

class Plane

end