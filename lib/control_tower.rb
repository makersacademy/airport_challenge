require_relative 'plane'
require_relative 'weather'

class ControlTower
  @weather = Weather.new

  def order_take_off(plane, airport)
    raise 'cannot take off in stormy conditions' if adverse_conditions?
    plane.take_off
    airport.dispatch(plane)
  end

  def order_landing(plane, airport)
    raise 'cannot land in stormy conditions' if adverse_conditions?
    plane.land(airport)
    airport.receive(plane)
  end

  def adverse_conditions?
    @weather.stormy?
  end
end
