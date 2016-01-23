require_relative 'airplane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize(weather: Weather.new)
    @planes = []
    @storm = weather.stormy?
  end

  def set_capacity(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def planes
    @planes
  end

  def land(plane)
    raise "This airport is full!" if full?
    raise "Your flight has been delayed due to a storm" if @storm
    @planes << plane
    "#{plane} has landed."
  end

  def take_off(plane)
    @planes.delete(plane)
    "#{plane} has taken off."
  end

  private

  def full?
    @planes.count >= set_capacity
  end
end



