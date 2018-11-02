class Plane
  def land(airport)
    raise 'This plane has already landed' if @current_port
    airport.accept(self)
    @current_port = airport
  end

  def take_off
    raise 'The plane is not on the ground' unless @current_port
    @current_port.release(self)
  end

  private
  attr_accessor :current_port

end
