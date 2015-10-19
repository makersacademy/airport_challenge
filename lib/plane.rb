class Plane

  attr_accessor :location, :status

  def initialize
    @location
    @status = :flying
  end

  def land(airport)
    raise_land_errors(airport)
    airport.planes << self
    self.location = airport.location
    self.status = :docked
  end

  def take_off(airport)
    raise_take_off_errors(airport)
    self.status = :flying
    self.location = ''
    airport.planes.delete(self)
  end

  private

  def raise_land_errors(airport)
    raise 'You are not flying' if self.status == :docked
    raise 'The airport is currently full' if airport.full?
    raise 'Cannot land in stormy weather' if airport.stormy? == true
  end

  def raise_take_off_errors(airport)
    raise 'You are already flying' if self.status == :flying
    raise 'You cannot take off from that airport' if self.location != airport.object_id
  end




end
