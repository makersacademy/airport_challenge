require_relative "./plane.rb"

# Custom errors for Airport class
class AirportError < StandardError; end

class Airport
  attr_reader :identifier, :capacity, :planes_parked

  DEFAULT_CAPACITY = 50

  def initialize(identifier = "DEF", capacity = DEFAULT_CAPACITY)
    raise AirportError, "Airport identifier must be a string" unless identifier.is_a?(String)
    raise AirportError, "Airport identifier must be three capital letters" unless identifier.length == 3 && identifier.upcase == identifier
    @identifier = identifier.to_s.to_sym
    raise AirportError, "Airport capacity must be positive integer" unless capacity > 0 && capacity.is_a?(Integer)
    @capacity = capacity
    @planes_parked = []
  end

  def park(plane)
    raise AirportError, "Airport is full" if full?
    plane.arrive_at(self)
    @planes_parked << plane
  end

  private

  def full?
    planes_parked.count >= capacity ? true : false
  end

end
