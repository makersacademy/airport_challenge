require_relative 'airplane.rb'
require_relative 'weather.rb'


class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize(weather: Weather)
    @planes = []
    @weather = weather
  end

  def set_capacity(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def land(plane)
    raise "This airport is full!" if full?
    raise "This plane has already landed!" if planes.include?(plane)
    raise "Your flight has been delayed due to a storm" if @weather.new.stormy?
    @planes << plane
    "#{plane} has landed."
  end

  def take_off(plane)
    raise "This plane isn't in this airport" if !planes.include?(plane)
    raise "Your flight has been delayed due to a storm" if @weather.new.stormy?
    @planes.delete(plane)
    "#{plane} has taken off."
  end

  private

  def full?
    @planes.count >= set_capacity
  end
end
