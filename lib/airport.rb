require_relative 'airplane'

class Airport
  attr_accessor :airplane, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @airplane = []
    @capacity = capacity
  end

  def land(airplane)
    raise 'Airport is full' if full?
    @airplane << airplane
  end

  def take_off(airplane)
    @airplane=airplane
  end

  private
  def full?
    @airplane.length >= @capacity
  end

end
