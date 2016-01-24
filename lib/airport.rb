require_relative 'plane'
require_relative 'weather'

class Airport
  DEF_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity=DEF_CAPACITY, weather=Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail 'Cannot land on a storm! Try again!' if @weather.stormy?
    fail 'Cannot land on full airport!' if full?
    @planes << plane.land
    planes
  end

  def take_off(plane)
    fail 'Cannot take off on a storm! Try again!' if @weather.stormy?
    fail 'Plane not in the airport!' unless @planes.include?(plane)
    @planes.delete(plane.take_off)
  end

  def planes
    @planes.dup
  end

  private
  def full?
    @planes.count == @capacity
  end
end
