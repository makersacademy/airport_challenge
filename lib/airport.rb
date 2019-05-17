class Airport 
  attr_reader :landed_planes, :weather_number

  def initialize
    @landed_planes = []
  end

  def take_off(plane)
    raise "too stormy to take off" if plane.weather_number == 1
    plane.flying = true
    @landed_planes = @landed_planes - [plane]
    @landed_planes
  end

  def land_plane(plane)
    raise "too stormy to land" if plane.weather_number == 1
    plane.flying = false
    @landed_planes.push(plane)
  end
end