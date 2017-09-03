require_relative 'airplane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :airplanes

  def initialize(capacity=DEFAULT_CAPACITY)
    @airplanes = []
    @capacity = capacity
  end

  def land(airplane)
    fail 'Airport is full' if full?
    airplane.landed=(true)
    @airplanes << airplane
  end

  def takeoff(airplane)
    fail 'No airplanes in the airport' if empty?
    airplane.landed=(false)
    @airplanes.delete(airplane)
  end

  private

  attr_writer :airplanes

  def full?
    @airplanes.count >= @capacity
  end

  def empty?
    @airplanes.empty?
  end
end
