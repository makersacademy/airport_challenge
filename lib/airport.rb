class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    return plane
  end

  def take_off(plane)
    @hangar.delete(plane)
    return plane
  end

  def in_airport?(plane)
    return @hangar.include?(plane)
  end

end