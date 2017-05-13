class Plane
  attr_reader :location
  def initialize
    @location = "up in the air"
  end

  def update_location(airportID)
    
  end

  def report_landed
  end

  def flying?
    @location == "up in the air"
  end

end
