class Airport 
  attr_reader :landed_planes

  def initialize(capacity = 5)
    @landed_planes = []
    @capacity = capacity
  end

  def take_off(plane, weather)
    raise "plane already flying" if plane.flying

    raise "too stormy to take off" if weather.weather_number == 1

    plane.flying = true
    @landed_planes -= [plane]
  end

  def land_plane(plane, weather)
    raise "plane already landed" if plane.flying == false

    raise "airport is full, landing not possible" if full?

    raise "too stormy to land" if weather.weather_number == 1

    plane.flying = false
    @landed_planes.push(plane)
  end

  def full?
    @landed_planes.length >= @capacity
  end
end
