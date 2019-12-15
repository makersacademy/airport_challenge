require 'air_traffic_controller'

class Airport
  attr_reader :iata_code, :planes

  def initialize(iata_code = 'LHR', capacity = 20)
    unless AirTrafficController::AVAILABLE_AIRPORTS.include?(iata_code.to_sym)
      raise("Airport not available, please enter allowed airport code.\nThe following airports are available: #{AirTrafficController::AVAILABLE_AIRPORTS.join(', ')}")
    end

    @iata_code = iata_code.to_sym
    @capacity = capacity
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
