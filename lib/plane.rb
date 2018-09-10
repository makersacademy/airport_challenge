class Plane
  attr_reader :ground_location

  def land(airport)
    raise "This plane already landed!" unless @ground_location.nil?
    airport.planes << self
    @ground_location = airport
  end

  def take_off(airport)
    raise "This plane is already in the air!" if @ground_location.nil?
    raise "The plane can only take off from the airport where it is grounded!" if @ground_location != airport
    raise "Can't take off in stormy conditions!" if airport.stormy?
    airport.planes.delete(self)
    @ground_location = nil
  end

end
