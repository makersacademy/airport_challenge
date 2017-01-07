require_relative "weather_station"

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :weather_station, :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY, station = WeatherStation.new)
    @capacity = capacity
    @weather_station = station
    @planes = []
  end

  def plane_landed plane
  end

  def plane_taken_off plane
  end

  def take_off_request?
    !stormy?
  end

  def landing_request?
    !stormy? && !full?
  end

  def full?
    planes.size >= capacity
  end

  def stormy?
    weather_station.stormy?
  end

end
