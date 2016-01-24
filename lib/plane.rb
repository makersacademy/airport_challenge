require_relative "airport"

class Plane
  # FIXME: remove for encapsulation
  # attr_reader :airport
  # New planes should always be instantiated from an airport
  def initialize(airport)
    @airport = airport
  end

  def land(destination)
    raise "Unable to land plane in stormy weather" if destination.stormy?
    arrive_at destination
    return true
  end

  def take_off
    raise "Unable to take off in stormy weather" if airport.stormy?
    depart_airport
    return true
  end

  def location
    if in_flight?
      return nil
    else
      return airport.code
    end
  end

  def in_flight?
    airport.nil?
  end

  private

  attr_reader :airport

  def depart_airport
    @airport = nil
  end

  def arrive_at(destination)
    @airport = destination
  end
end
