class Plane
  def land(airport)
    can_i_land_at?(airport)
    airport.accept(self)
    @current_port = airport
  end

  def take_off
    can_i_take_off?
    @current_port.release(self)
    @current_port = nil
  end

  private

  def can_i_land_at?(airport)
    raise 'This plane is on the ground' unless @current_port.nil?
    raise 'Stormy weather prevents the plane from landing' if airport.stormy?
    raise 'Cannot land at this airport as it is full' if airport.full?
  end

  def can_i_take_off?
    raise 'The plane is not on the ground' if @current_port.nil?
    raise 'Stormy weather prevents the plane from taking off' if @current_port.stormy?
  end
end
