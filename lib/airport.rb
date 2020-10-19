class Airport

  require_relative 'plane'
  require_relative 'weather'

  attr_reader :airport_array
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_array = []
    @capacity = capacity
  end

  def land(plane, forecast)
    raise "It is too stormy to land" unless forecast.weather_check
    raise "The airport is full" if full

    @airport_array << plane

  end

  def take_off(plane, forecast)
    raise "It is too stormy to take off" unless forecast.weather_check

    @airport_array.delete_at(airport_array.find_index(plane))
    "The plane has successfully left the airport"
  end

  private

  def full
    @airport_array.length >= @capacity
  end

end
