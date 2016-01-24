require_relative 'airport'

class Plane
  # NOTE: should new planes always be instantiated from an airport?
  def initialize(airport=nil)
    @airport = airport
  end

  # TODO: guard against landing if not in_flight
  def land(destination)
    raise "Unable to land plane in stormy weather" if destination.stormy?
    destination.inbound self
    set_location destination
    # NOTE: consider changing this to a string
    return true
  end

  # TODO: guard against taking off if in_flight
  def take_off
    raise "Unable to take off in stormy weather" if airport.stormy?
    airport.outbound self
    set_location nil
    # NOTE: consider changing this to a string
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

  # NOTE: consider overwriting #inspect

  private
  attr_reader :airport

  def set_location(location)
    @airport = location
  end
end
