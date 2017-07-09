require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather, :capacity

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
    puts "#{plane} has landed"
  end

  def take_off(plane)
    fail 'The airport is empty!' if empty?
    fail 'Error plane cannot fly in stormy weather' if stormy?
    @planes.delete(plane)
    puts "#{plane} has taken off"
  end

  private

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
