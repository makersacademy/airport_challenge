require_relative 'airport'

class Plane
  # Planes must always be instantiated from an airport
  def initialize(airport)
    @airport = airport
    airport.inbound(self)
  end

  def land_at(destination)
    # NOTE: assumes destination is an Airport object. See comment on line 31 in
    # spec/plane_spec.rb
    fail "Plane is not in flight!" unless in_flight?
    fail "Unable to land at #{destination} due to stormy weather" if destination.stormy?
    destination.inbound self
    new_location destination
    # NOTE: consider changing this to a string confirmation
    true
  end

  def take_off
    fail "Plane is in flight!" if in_flight?
    fail "Unable to take off in stormy weather" if airport.stormy?
    airport.outbound self
    new_location nil
    # NOTE: consider changing this to a string confirmation
    true
  end

  def location
    if in_flight?
      "In flight"
    else
      "#{airport}"
    end
  end

  def in_flight?
    airport.nil?
  end

  # NOTE: consider overwriting #inspect

  private
  attr_reader :airport

  def new_location(location)
    @airport = location
  end
end
