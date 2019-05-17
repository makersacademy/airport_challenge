class Airport 
  attr_reader :landed_planes, :weather_number

  def initialize
    @landed_planes = []
  end

  def land_plane(plane)
    # raise "too stormy to land" if weather_number == 1
    plane.flying = false
    @landed_planes.push(plane)
  end

  def take_off(plane)
    # raise "too stormy to take off" if weather_number == 1
    plane.flying = true
    @landed_planes = @landed_planes - [plane]
    @landed_planes
  end

  def weather_number
    rand(1..6)
  end
end