class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def lands_plane(plane, weather)
    weather = weather.condition
    raise "Weather is stormy. Plane cannot land." if weather == "stormy"
    plane.land
    @planes << plane
  end

  def takes_off_plane(plane, weather)
    weather = weather.condition
    raise "Weather is stormy. Plane cannot take off." if weather == "stormy"
    plane.take_off
    @planes.delete(plane)
    "#{plane} not in airport" unless @planes.include?(plane)
  end
end
