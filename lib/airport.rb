class Airport

  attr_accessor :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def lands_a_plane(plane, weather)
    weather = weather.condition
    planes_in_airport = planes.count
    raise "Weather is stormy. Plane cannot land." if weather == "stormy"
    raise "Airport is full. Plane cannnot land." if planes_in_airport >= 5
    plane.land
    @planes << plane
  end

  def instructs_takeoff(plane, weather)
    weather = weather.condition
    raise "Weather is stormy. Plane cannot take off." if weather == "stormy"
    plane.take_off
    @planes.delete(plane)
    "#{plane} not in airport" unless @planes.include?(plane)
  end
end
