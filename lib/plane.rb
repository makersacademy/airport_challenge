require_relative 'airport'

class Plane
  # NOTE: should new planes always be instantiated from an airport?
  def initialize(airport=nil)
    @airport = airport
  end

  def land_at(destination)
    raise "Plane is not in flight!" if !in_flight?
    raise "Unable to land plane in stormy weather" if destination.stormy?
    destination.inbound self
    set_location destination
    # NOTE: consider changing this to a string
    return true
  end

  def take_off
    raise "Plane is in flight!" if in_flight?
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
