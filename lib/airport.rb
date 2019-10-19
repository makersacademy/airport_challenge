class Airport

  attr_reader :airport_code

  def initialize(airport_code)
    @aircraft_present = []
    @airport_code = airport_code
  end

  def airport_landing(plane)
    @aircraft_present << plane
    return true
  end

end
