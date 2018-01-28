class Plane
  attr_reader :plane

  def land(plane)
    "#{plane} has now landed."
  end

  def takeoff(plane)
    "#{plane} has now departed."
  end
end
