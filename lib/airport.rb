class Airport 
  attr_reader :landed_planes, :weather_number

  def initialize
    @landed_planes = []
    @capacity = 1
  end

  def take_off(plane, weather)
    raise "too stormy to take off" if weather.weather_number == 1
    plane.flying = true
    @landed_planes = @landed_planes - [plane]
    @landed_planes
  end

  def land_plane(plane, weather)
    raise "too stormy to land" if weather.weather_number == 1
    plane.flying = false
    @landed_planes.push(plane)
  end

  def full?
    @landed_planes.length >= @capacity
  end
end