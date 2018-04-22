require_relative 'weather_station'
class Airport

  attr_reader :capacity, :planes, :weather
  DEFAULT_CAPACITY = 1

  def initialize(capacity: DEFAULT_CAPACITY,
                 weather_station: WeatherStation.new)
    @capacity = capacity
    @planes = []
    @weather_station = weather_station
  end

  def order_landing(plane)
    check_weather
    raise 'Landing prevented, stormy weather' if @weather == 'stormy'
    raise 'Cannot land, airport full' if @planes.length == @capacity
    plane.land(__id__)
    @planes.push(plane)
  end

  def order_takeoff(plane)
    check_weather
    raise 'Takeoff prevented, stormy weather' if @weather == 'stormy'
    plane.takeoff(__id__)
    @planes.delete(plane)
  end

  def check_weather
    @weather = @weather_station.report
  end

end
