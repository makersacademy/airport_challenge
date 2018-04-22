class Airport

  attr_accessor :planes, :weather, :DEFAULT_CAPACITY

  def initialize(capacity = 20)
    @planes = []
    @weather = random_weather
    @DEFAULT_CAPACITY = capacity
  end

  def land(plane)
    raise "It is too stormy for the plane to land" if self.weather == "stormy" || @planes.length >= 20
    @planes << plane
  end

  def take_off(plane)
    raise "It is too stormy for the plane to take off" if self.weather == "stormy"
    @planes.delete(plane)
  end

  def is_plane_present?(plane)
    @planes.include?(plane)
  end

  def random_weather
    rand(9) <= 7 ? "sunny" : "stormy"
  end

end
