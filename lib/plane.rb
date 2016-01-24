require_relative 'airport'

class Plane
  # NOTE: new planes should always be instantiated from an airport
  def initialize(airport=nil)
    @airport = airport
  end

  # TODO: guard against landing if not in_flight
  def land(destination)
    raise "Unable to land plane in stormy weather" if destination.stormy?
    set_location destination
    return true
  end

  # TODO: guard against taking off if in_flight
  def take_off
    raise "Unable to take off in stormy weather" if airport.stormy?
    set_location nil
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

  def set_location(location)
    @airport = location
  end
end
