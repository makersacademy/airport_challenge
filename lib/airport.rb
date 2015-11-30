require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land! plane
    fail 'Too stormy!' if weather.stormy?
    fail 'The airport is full!' if full?
    plane.land! self
    planes << plane
  end

  def take_off! plane
    fail 'Too stormy!' if weather.stormy?
    fail 'Plane not found!' unless contain? plane
    plane.take_off! 
    planes.delete plane
  end

  def contain? plane
    planes.include? plane
  end

  private

  attr_reader :planes, :weather, :capacity

  def full?
    planes.size >= capacity
  end
end
