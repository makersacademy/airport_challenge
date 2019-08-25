class Airport
  class PlaneNotFound < RuntimeError
  end

  class AirportFull < RuntimeError
  end

  class PlaneAlreadyLanded < RuntimeError
  end

  class BadWeather < RuntimeError
  end

  DEFAULT_CAPACITY = 100.freeze

  def initialize(capacity = DEFAULT_CAPACITY, weather_station)
    @capacity = capacity
    @weather_station = weather_station
    @planes = Set.new
  end

  def land(plane)
    raise_if_bad_weather
    raise_if_already_landed(plane)
    raise_if_full

    @planes.add(plane)
  end

  def take_off(plane)
    raise_if_bad_weather
    raise_if_not_found(plane)

    @planes.delete(plane)
  end

  def landed?(plane)
    @planes.include?(plane)
  end

  private

  def raise_if_bad_weather
    raise BadWeather if bad_weather?
  end

  def bad_weather?
    @weather_station.weather == :stormy
  end

  def raise_if_already_landed(plane)
    raise PlaneAlreadyLanded if landed?(plane)
  end

  def raise_if_not_found(plane)
    raise PlaneNotFound unless landed?(plane)
  end

  def raise_if_full
    raise AirportFull if full?
  end

  def full?
    @planes.count == @capacity
  end
end