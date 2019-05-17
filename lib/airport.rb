class Airport

  attr_reader :show_planes, :weather
  # I want to see all planes
  # I want to add a plane to the airport (land a plane)

  def initialize
    @show_planes = []
  end
  def land(plane)
    @show_planes.length < 4 ? @show_planes.push(plane) : "There's no more space on the runway"
  end
  def plane_takeoff
      show_planes.pop()
  end
  def weather
  end
end
