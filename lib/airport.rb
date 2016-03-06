require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes, :weather

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def change_capacity quantity
    @capacity = quantity
  end

  def land plane
    fail 'Bad weather - cant\'t land!' if weather.stormy?
    fail 'Airport full - cant\'t land!' if full?
    plane.land self
    @planes << plane
  end

  def full?
    @planes.length >= 20
  end

  def take_off plane
    fail 'Bad weather - cant\'t take off!' if weather.stormy?
    plane.take_off
    @planes.delete plane
  end
end
