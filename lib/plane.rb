require_relative "airport"

class Plane
  # FIXME: remove for encapsulation
  # attr_reader :airport
  # New planes should always be instantiated from an airport
  def initialize(airport)
    @airport = airport
  end

  def land(destination)
    unless destination.stormy?
      arrive_at destination
      return true
    end
  end

  def take_off
    unless airport.stormy?
      depart_airport
      return true
    end
  end

  # TODO: implement #location to provide info on in_flight or airport

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
