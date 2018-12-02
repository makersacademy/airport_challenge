require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @airplanes = []
    @weather = weather
  end

  def land(airplane)
    fail 'The plane has already landed' if in_the_airport?(airplane)
    fail 'Airport full' if full?
    fail 'The weather is stormy' if @weather.stormy?
    @airplanes << airplane
  end

  def take_off(airplane)
    fail 'The plane hasnt landed yet' unless in_the_airport?(airplane)
    fail 'The weather is stormy' if @weather.stormy?
    @airplanes.select { |plane| plane == airplane }.first
  end

  def in_the_airport?(airplane)
    @airplanes.include?(airplane)
  end

  private

  def full?
    @airplanes.length >= @capacity
  end

end
