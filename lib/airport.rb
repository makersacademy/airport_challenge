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
    raise "Airport full. Plane cannot land." if planes_in_airport >= @capacity
    raise "Plane already in airport." if @planes.include?(plane)
    plane.land
    @planes << plane
  end

  def instructs_takeoff(plane, weather)
    weather = weather.condition
    raise "Weather is stormy. Plane cannot take off." if weather == "stormy"
    raise "Plane not in airport." unless @planes.include?(plane)
    plane.take_off
    @planes.delete(plane)
  end
end
