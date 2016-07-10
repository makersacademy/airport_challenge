require_relative 'airplane'
require_relative 'weather'

class Airport

  def initialize
    @airplanes = []
  end

  def instruct_to_land(airplane)
    @airplanes << airplane
    airplane.land
  end

  def instruct_to_take_off(airplane)
    @airplanes.delete(airplane)
    airplane.take_off
  end
end
