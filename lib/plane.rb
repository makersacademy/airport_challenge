class Plane
  attr_accessor :status

  def initialize
    @status = :in_factory
  end

  def land(airport)
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
    if airport.weather_conditions == :stormy
      raise "Authorization denied due to stormy weather"
    end
    @status = :in_flight
    airport.confirm_take_off(self)
  end
end
