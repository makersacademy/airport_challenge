require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def full?
    hangar.size >= capacity
  end

  def stormy?
    weather.forecast
  end
end
