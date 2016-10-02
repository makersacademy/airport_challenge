class Airport

  attr_reader :capacity, :weather, :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = "sunny"
    @planes = []
  end

  def accept_plane(plane)
    change_weather
    raise "A #{plane.class} is not a plane" unless plane.class == Plane
    raise "This plane has already landed" if plane_present?(plane)
    raise "Plane cannot land due to poor weather" if @weather == "stormy"
    raise "Plane cannot land; airport is at capacity" if @planes.length == @capacity
    @planes << plane
  end

  def plane_departs(plane)
    change_weather
    raise "A #{plane.class} is not a plane" unless plane.class == Plane
    raise "This plane is not at this airport" unless plane_present?(plane)
    raise "Plane cannot take off due to poor weather" if @weather == "stormy"
    @planes.delete(plane)
  end

  def plane_present?(plane)
    @planes.include? plane
  end

  def weather_index
    rand(10)
  end

  def change_weather
    weather_array = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "cloudy", "drizzle", "stormy", "stormy"]
    @weather = weather_array[weather_index]
  end

end
