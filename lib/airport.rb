require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land! plane
    fail 'Too stormy!' if stormy?
    fail 'The airport is full!' if full?
    plane.land! self
    planes << plane
  end

  def take_off! plane
    fail 'Too stormy!' if stormy?
    fail 'Plane not found!' unless contain? plane
    plane.take_off! 
    planes.delete plane
  end

  def contain? plane
    planes.include? plane
  end

  private

  attr_reader :planes, :capacity

  def full?
    planes.size >= capacity
  end
end
