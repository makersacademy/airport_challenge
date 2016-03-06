require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def change_capacity quantity
    @capacity = quantity
  end

  def land plane
    fail 'Bad weather - cant\'t land!' if not_safe?
    fail 'Airport full - cant\'t land!' if full?
    plane.land self
    @planes << plane
  end

  def take_off plane
    fail 'Bad weather - cant\'t take off!' if not_safe?
    plane.take_off
    @planes.delete plane
  end

  private

  def not_safe?
    Weather.stormy?
  end
  
  def full?
    @planes.length >= 20
  end
end
