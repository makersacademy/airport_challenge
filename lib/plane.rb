require_relative 'airport'

class Plane
  attr_reader :airport

  def initialize
    # @airport = nil
  end

  def land(airport)
    raise("Plane not in flight") unless @airport.nil?
    raise("Airport does not exist") unless airport.instance_of? Airport

    @airport = airport
  end

  def take_off
    raise("Plane not at an airport") if @airport.nil?

    @airport = nil
  end
end
