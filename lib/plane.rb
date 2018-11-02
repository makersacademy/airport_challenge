class Plane
  attr_accessor :current_port
  def land(airport)
    airport.accept(self)
    @current_port = airport
  end

  def take_off
    @current_port.release(self)
  end
end
