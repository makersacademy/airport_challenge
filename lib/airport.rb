class Airport 
  # attr_accessor :plane

  def initialize 
    @airport = []
  end

  def land(plane)
    @plane = plane
    @airport << @plane
  end

  def take_off(plane)
    @plane = plane
    @airport.delete(@plane)
    "Euston we have lift off"
  end
end