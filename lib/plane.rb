class Plane
  def land(airport)
    raise 'This plane has already landed' unless @current_port.nil?
    airport.accept(self)
    @current_port = airport
  end

  def take_off
    raise 'The plane is not on the ground' if @current_port.nil?
    @current_port.release(self)
    @current_port = nil
  end

  private
  attr_accessor :current_port

end
