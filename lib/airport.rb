class Airport
  def initialize
    @planes = []
  end

  def weather_rand
    rand(100)
  end

  def takeoff
    raise "It is too stormy to take off!" if weather_rand <= 10
    raise "Airport empty" if @planes.empty?
    @planes.pop
    Plane.new
    "Plane departed."
  end

  def land(plane)
    raise "It is too stormy to land!" if weather_rand <= 10
    @plane = plane
    raise "Can't land, airport is full." if @planes.count >= 5
    @planes << plane
    "Plane landed."
  end
end
