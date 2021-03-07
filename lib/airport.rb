class Airport
  attr_reader :planes_at_airport, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(name = "airport", capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @name = name
    @planes_at_airport = []
    @weather = Weather.new
  end

  def full?
    @planes_at_airport.length == @capacity
  end

  def change_capacity(capacity)
    raise "Too many planes for reduced capacity" if @planes_at_airport.length > capacity

    @capacity = capacity
  end

  def stormy?
    @weather.forecast == "stormy"
  end

  def plane_list
    @planes_at_airport
  end

  def plane?(plane)
    @planes_at_airport.include?(plane)
  end

  def land(plane)
    raise "Airport Full" if full?
    raise "Weather stormy; plane cannot land" if stormy?
    raise "Plane already in airport" if plane?(plane)
    raise "Plane can't land if it isn't flying" if plane.location != "In the air"

    @planes_at_airport << plane
    plane.change_location(@name)
  end

  def take_off(plane)
    raise "Weather stormy; plane cannot take off" if stormy?
    raise "Plane is already in the air" if plane.location == "In the air"
    raise "Plane isn't in airport" unless plane?(plane)

    @planes_at_airport.delete(plane)
    plane.change_location("In the air")
  end
end
