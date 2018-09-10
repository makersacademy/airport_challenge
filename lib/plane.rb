class Plane
  attr_reader :ground_location

  def initialize(airport = nil)
    @ground_location = airport
  end

  def land(airport)
    raise "Can't land in stormy conditions!" if airport.stormy?
    raise "This plane already landed!" unless @ground_location.nil?
    airport.planes << self
    @ground_location = airport
  end

  def take_off
    raise "This plane is already in the air!" if @ground_location.nil?
    raise "Can't take off in stormy conditions!" if @ground_location.stormy?
    @ground_location.planes.delete(self)
    @ground_location = nil
  end

end
