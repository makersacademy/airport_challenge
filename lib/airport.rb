class Airport
  def initialize
    @aircraft_present = []
  end

  def airport_landing(plane)
    @aircraft_present << plane
    return true
  end

end
