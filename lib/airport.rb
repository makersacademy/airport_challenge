require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    check_weather
    fail 'plane already landed' if landed? plane
    fail 'airport full!' if full?
    fail 'can not land, weather condition stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    check_weather
    fail 'already airborne' unless landed? plane
    fail 'can not take off, weather condition stormy' if stormy?
    @planes.delete(plane)
  end

private
  def landed?(plane)
    @planes.include? plane
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather.condition == 'stormy'
  end

  def check_weather
    @weather.condition
  end

end
