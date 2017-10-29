class Plane
  attr_accessor :status

  def initialize
    @status = :in_factory
  end

  def land(airport)
    @status = :landed
    airport.dock(self)
  end

  def take_off(airport)
    @status = :in_flight
    airport.confirm_take_off(self)
  end
end
