class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = []
    @current_weather = "Unknown"
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Cannot land during stormy weather" if stormy?

    plane.change_location(@name)
    @planes << plane
  end

  def take_off(serial_number)
    raise "Cannot take off during stormy weather" if stormy?

    departing_plane = fetch_plane(serial_number)
    raise "Plane not found at this airport" if departing_plane.nil?

    departing_plane.change_location("Sky")
    @planes.delete(departing_plane)
  end

  def weather_update(weather)
    @current_weather = weather
  end

  def print_planes
    @planes.each { |plane| puts plane.registration }
  end

  private

  def fetch_plane(serial_number)
    @planes.find { |plane| plane.serial_number == serial_number }
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @current_weather == "Stormy"
  end

end
