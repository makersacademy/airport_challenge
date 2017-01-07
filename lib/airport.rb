require_relative "weather_station"

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :weather_station, :planes , :capacity

  def initialize(init_capacity = DEFAULT_CAPACITY, station = WeatherStation.new)
    @capacity = init_capacity
    @weather_station = station
    @planes = []
  end

  def plane_landed plane
    @planes << plane
  end

  def plane_taken_off plane
    @planes.delete plane
  end

  def full?
    planes.size >= capacity
  end

  def stormy?
    weather_station.stormy?
  end

end
