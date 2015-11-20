require_relative 'airplane'
require_relative 'weather'

class Airport
  attr_accessor :airplane, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @airplane = []

  end

  def land(airplane)
    raise 'Airport is full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @airplane << airplane
  end

  def take_off(airplane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    raise 'Cannot take off plane: plane not at this airport' if !at_airport?(airplane)
    @airplane.pop
  end

  private
  def full?
    @airplane.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(airplane)
    @airplane.include?(airplane)
  end

end
