require_relative 'airplane'

class Airport
  def initialize
    @airplanes = []
  end

  attr_reader :airplanes

  def land(airplane)
    airplane.landed=(true)
    @airplanes << airplane
  end

  def takeoff(airplane)
    fail 'No airplanes in the airport' if @airplanes.empty?
    airplane.landed=(false)
    airplane
  end
end
