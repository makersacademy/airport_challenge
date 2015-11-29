require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize (weather, capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land plane
    fail 'It is too stormy!' if stormy?
    fail 'The airport is full!' if full?
    fail 'That is not a plane!' if not_a? plane
    plane.land self
    planes << plane
    self
  end

  def take_off plane
    fail 'It is too stormy!' if stormy?
    fail 'Plane not found!' unless contain? plane
    plane.take_off 
    planes.delete plane
    self
  end

  def contain? plane
    planes.include? plane
  end

  def stormy?
    weather.stormy?
  end

  private

  attr_reader :planes, :weather, :capacity

  def not_a? plane
    plane.class.to_s != 'Plane'
  end

  def full?
    planes.count >= capacity
  end
end
