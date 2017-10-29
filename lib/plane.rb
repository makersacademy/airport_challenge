class Plane

  attr_accessor :status

  def initialize
    @status = :in_flight
  end

  def land(airport)
    raise "This plane is already in land" unless status == :in_flight
    raise "Authorization denied due to stormy weather" if airport.weather_conditions == :stormy
    raise "Authorization denied due to full airport" if airport.full?
    @status = :landed
    airport.planes << self
  end

  def take_off(airport)
    raise "This plane is in flight" unless status == :landed
    raise "Plane located in different airport" unless in?(airport)
    raise "Authorization denied due to stormy weather" if airport.weather_conditions == :stormy
    @status = :in_flight
    confirm_take_off(airport)
  end

  def confirm_take_off(airport)
    airport.planes.delete(self)
  end

  def in?(airport)
    return true if airport.planes.include?(self)
  end

end
