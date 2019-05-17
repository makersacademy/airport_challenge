class Airport

  attr_reader :show_planes
  # I want to see all planes
  # I want to add a plane to the airport (land a plane)

  def initialize
    @show_planes = []
  end

  def land(plane)
    @show_planes.push(plane)
  end

  def plane_takeoff
    @show_planes.pop()
  end

end
