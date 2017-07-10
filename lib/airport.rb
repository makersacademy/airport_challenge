require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail 'The airport is full!' if full?
    fail 'Error plane cannot land in stormy weather' if stormy?
    @planes << plane
  end

  def take_off(plane)
    fail 'The airport is empty!' if empty?
    fail 'Error plane cannot fly in stormy weather' if stormy?
    @planes.delete(plane)
  end

  private

  attr_reader :weather

  def stormy?
    @weather.weather_report == :stormy
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.count.zero?
  end
end
