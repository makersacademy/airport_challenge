require './lib/airport.rb'

module TakeOff
  def take_off
    @location = "in the air"
  end
end

module Land
  def land(airport)
    @location = airport
    self
  end
end

class Plane
  attr_reader :location
  include TakeOff, Land

  def initialize
    @location = nil
  end

end
