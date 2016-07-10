require_relative 'airplane'

class Airport

  def initialize
    @airplanes = []
  end

  def instruct_to_take_off(airplane)
    raise 'Airplane cannot take off. Wait for the storm to pass' if stormy?
    @airplanes.delete(airplane)
    take_off(airplane)
  end

  def instruct_to_land(airplane)
    raise 'Airplane cannot land. Wait for the storm to pass' if stormy?
    @airplanes << airplane
    land(airplane)
  end

# Weather is decided here
  def stormy?
    rand(1..10) < 3
  end

  private

  def land(airplane)
    airplane.land
  end

  def take_off(airplane)
    airplane.take_off
  end

end
