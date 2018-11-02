class Plane
  def land(airport)
    raise 'This plane has already landed' unless @current_port.nil?
    raise 'Stormy weather prevents the plane from landing' if airport.stormy?
    raise 'Cannot land at this airport as it is full' if airport.full?
    airport.accept(self)
    @current_port = airport
  end

  def take_off
    raise 'The plane is not on the ground' if @current_port.nil?
    raise 'Stormy weather prevents the plane from taking off' if @current_port.stormy?
    @current_port.release(self)
    @current_port = nil
  end
end
