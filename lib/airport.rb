require_relative 'airplane.rb'
require_relative 'weather.rb'


class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize(weather: Weather)
    @planes = []
    @weather = weather
  end

  def capacity(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    fail "This airport is full!" if full?
    fail "Plane has already landed" if planes.include?(plane)
    fail "Flight delayed due to a storm" if @weather.new.stormy?
    @planes << plane
    "#{plane} has landed."
  end

  def take_off(plane)
    fail "Plane isn't in the airport" if !planes.include?(plane)
    fail "Flight delayed due to a storm" if @weather.new.stormy?
    @planes.delete(plane)
    "#{plane} has taken off."
  end

  private

  def full?
    @planes.count >= capacity
  end
end
