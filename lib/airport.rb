require_relative 'airplane'

class Airport
  def initialize
    @airplanes = []
    @capacity = 1
  end

  attr_reader :airplanes
  attr_writer :airplanes

  attr_reader :capacity
  attr_writer :capacity

  def land(airplane)
    fail 'Airport is full' if @airplanes.count == @capacity
    airplane.landed=(true)
    @airplanes << airplane
  end

  def takeoff(airplane)
    fail 'No airplanes in the airport' if @airplanes.empty?
    airplane.landed=(false)
    airplane
  end
end
