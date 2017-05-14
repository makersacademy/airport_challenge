require_relative "./plane.rb"

# Custom errors for Airport class
class AirportError < StandardError; end

class Airport
  attr_reader :identifier, :capacity, :planes_parked

  # DEF_IDENTIFIER = "DEF"
  DEF_CAPACITY = 50
  STORM_PERCENTAGE = 0.80

  def initialize(identifier = "DEF", capacity = DEF_CAPACITY)
    raise AirportError, "Airport identifier must be a string" unless identifier.is_a?(String)
    raise AirportError, "Airport identifier must be three capital letters" unless identifier.length == 3 && identifier.upcase == identifier
    @identifier = identifier.to_s.to_sym
    raise AirportError, "Airport capacity must be an integer" unless capacity.is_a?(Integer)
    raise AirportError, "Airport capacity must be positive integer" unless capacity > 0
    @capacity = capacity
    @planes_parked = []
    @weather = randomise_weather
  end

  def park(plane)
    raise AirportError, "Is not safe to land" unless safe?
    raise AirportError, "Airport is full" if full?
    plane.land_at(identifier)
    @planes_parked << plane
  end

  def departure(plane)
    raise AirportError, "Is not safe to departure" unless safe?
    plane.take_off
    @planes_parked.delete(plane)
  end

  private

  def full?
    planes_parked.count >= capacity ? true : false
  end

  def safe?
    @weather == :safe ? true : false
  end

  def randomise_weather
    rand < STORM_PERCENTAGE ? :safe : :storm
  end

end
