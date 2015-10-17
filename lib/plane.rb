class Plane

  attr_reader :location
  attr_writer :location

  def initialize
    @location
  end

  def land(airport)
    raise 'The airport is currently full' if airport.full?
    raise 'Cannot land in stormy weather' if airport.weather == 'stormy'
    airport.planes << self
    self.location = airport.location

  end

  def take_off(airport)
    raise 'You cannot take off from that airport' if self.location != airport.object_id
  end



end
