require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :weather

  def initialize capacity=DEFAULT_CAPACITY, weather=Weather.new
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def change_capacity quantity
    # dont allow capacity to change once initialized - can change capacity to less than planes currently landed
    @capacity = quantity
  end

  def land plane
    not_safe?
    full?
    fail 'Plane already landed!' if plane.landed?
    plane.land self
    @planes << plane
  end

  def take_off plane
    not_safe?
    at_airport? plane
    plane.take_off self
    @planes.delete plane
  end

  def planes
    @planes.dup
  end

  private

  def not_safe?
    fail 'Bad weather!' if @weather.stormy?
  end

  def full?
    fail 'Airport full - cant\'t land!' if planes.length >= capacity
  end

  def at_airport? plane
    fail 'Not at airport - cant\'t take off!' unless planes.include? plane
  end
end
