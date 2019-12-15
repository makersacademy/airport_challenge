class Airport
  attr_reader :iata_code
  AVAILABLE_AIRPORTS = [:LHR, :LTN, :LGW]

  def initialize(iata_code)
    if AVAILABLE_AIRPORTS.include?(iata_code.to_sym)
      @iata_code = iata_code.to_sym
    else
      raise("Airport not available, please enter allowed airport code.\nThe following airports are available: #{AVAILABLE_AIRPORTS.join(', ')}")
    end
  end

end
