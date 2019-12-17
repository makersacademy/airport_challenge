class Airport
  attr_reader :iata_code, :planes

  def initialize(args = {})
    @iata_code = args[:iata_code] || :LHR
    unless AirTrafficController::AVAILABLE_AIRPORTS.include?(@iata_code)
      raise("Airport #{@iata_code} not available, please enter allowed airport code.\nThe following airports are available: #{AirTrafficController::AVAILABLE_AIRPORTS.join(', ')}")
    end

    @capacity = args[:capacity] || 20
    @planes = []
  end

  def airport_at_capacity?
    return @planes.length == @capacity
  end

  def land_plane(plane)
    @planes << plane
  end

  def plane_departure_ready?(plane)
    return @planes.include?(plane)
  end

  def plane_departed(plane)
    @planes.delete(plane)
  end

end
