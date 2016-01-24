require_relative "airport"

class Plane
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

  # NOTE: consider alternative implementation of #location and #in_flight?
  def location
    # NOTE: consider using guard statements over conditionals
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
