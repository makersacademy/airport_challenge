require 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @capacity = capacity
    @planes = []
    @weather = "Unknown"
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Cannot land during stormy weather" if stormy?

    plane.location = (@name)
    @planes << plane
  end

  def take_off(serial_number)
    raise "Plane not found at this airport" unless contains_plane?(serial_number)
    raise "Cannot take off during stormy weather" if stormy?
    
    departing_plane = fetch_plane(serial_number)
    departing_plane.location = ("Sky")
    @planes.delete(departing_plane)
  end

  def update_weather(weather)
    @weather = weather.weather_report
  end

  def print_planes
    @planes.each { |plane| puts plane.registration }
  end
  
  def contains_plane?(serial_number)
    fetch_plane(serial_number) != nil
  end

  private

  def fetch_plane(serial_number)
    @planes.find { |plane| plane.serial_number == serial_number }
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather == "Stormy"
  end
end
