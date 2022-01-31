require_relative 'airplane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :airplanes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airplanes = []
  end

  def land(airplane)
    raise 'Cannot land airplane due to airport being full' if full?
    raise 'Cannot land due to stormy weather' if stormy?
    @airplanes << airplane
  end

  def take_off(airplane)
    raise 'Cannot takeoff due to stormy weather' if stormy?
  end
  
  def full?
    @airplanes.length >= @capacity
  end

  def stormy?
    rand(1..6) > 4
  end
end
