require_relative 'plane'

class Airport
  DEF_CAPACITY = 10
  attr_reader :planes

  def initialize(capacity=DEF_CAPACITY, weather=Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Cannot land on a storm!' if @weather.stormy?
    fail 'Cannot land on full airport!' if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail 'Cannot take off on a storm!' if @weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

  private
  def full?
    @planes.count == @capacity
  end
end
