class Airport
  class PlaneNotFound < RuntimeError
  end

  class AirportFull < RuntimeError
  end

  class PlaneAlreadyLanded < RuntimeError
  end

  class BadWeather < RuntimeError
  end

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, weather_station)
    @capacity = capacity
    @planes = Set.new
    @weather_station = weather_station
  end

  def land(plane)
    raise_if_bad_weather
    raise_if_already_landed(plane)
    raise_if_full

    plane.is_landed = true
    @planes.add(plane)
  end

  def take_off(plane)
    raise_if_bad_weather
    raise_if_not_found(plane)

    plane.is_landed = false
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