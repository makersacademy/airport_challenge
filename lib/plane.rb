class Plane
  attr_accessor :status

  def initialize
    @status = :in_flight
  end

  def land(airport)
    raise "This plane is already in land" unless status == :in_flight
    if airport.weather_conditions == :stormy
      raise "Authorization denied due to stormy weather"
    end
    if airport.full?
      raise "Authorization denied due to full airport"
    end
    @status = :landed
    airport.dock(self)
  end

  def take_off(airport)
    raise "This plane is in flight" unless status == :landed
    raise "Plane located in different airport" unless in?(airport)
    if airport.weather_conditions == :stormy
      raise "Authorization denied due to stormy weather"
    end
    @status = :in_flight
    airport.confirm_take_off(self)
  end

  def in?(airport)
    return true if airport.planes.include?(self)
  end
end
