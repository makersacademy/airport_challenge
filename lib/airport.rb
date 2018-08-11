class Airport

  attr_reader :planes

  def initialize 
    @planes = [] 
  end

  def land(flight_number)
    @planes << Plane.new(flight_number)
  end

end
