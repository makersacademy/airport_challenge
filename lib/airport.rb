require_relative 'weather_station'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :hangar

  def initialize(capacity = DEFAULT_CAPACITY,weather = WeatherStation.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'Stormy weather! Do not land!' if stormy?
    fail 'Hangar full! Do not land!' if full?
    plane.land
    @hangar << plane
  end

  def take_off(plane)
    fail 'Plane not in the hangar!' unless hangar.include?(plane)
    fail 'Stomy weather! Do not take off!' if stormy?
    plane.take_off
    @hangar.delete(plane)
  end

  private

  attr_reader :weather, :capacity

  def stormy?
    weather.stormy?
  end

  def full?
    capacity == hangar.length
  end

end
