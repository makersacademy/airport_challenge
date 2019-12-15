class Airport
  attr_reader :iata_code, :planes
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def initialize(iata_code = 'LHR', capacity = 20)
    if AVAILABLE_AIRPORTS.include?(iata_code.to_sym)
      @iata_code = iata_code.to_sym
    else
      raise("Airport not available, please enter allowed airport code.\nThe following airports are available: #{AVAILABLE_AIRPORTS.join(', ')}")
    end
    @capacity = capacity
    @planes = []
  end

  def airport_at_capacity?
    return @planes.length == @capacity
  end

  def land_plane(plane)
    @planes << plane
  end

end
