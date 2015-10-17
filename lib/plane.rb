class Plane

  attr_reader :location, :status
  attr_writer :location, :status

  def initialize
    @location
    @status = 'flying'
  end

  def land(airport)
    raise 'You are not flying' if self.status == 'docked'
    raise 'The airport is currently full' if airport.full?
    raise 'Cannot land in stormy weather' if airport.weather == 'stormy'
    airport.planes << self
    self.location = airport.location
    self.status = 'docked'
  end

  def take_off(airport)
    raise 'You are already flying' if self.status == 'flying'
    raise 'You cannot take off from that airport' if self.location != airport.object_id
    self.status = 'flying'
    self.location = ''
  end



end
