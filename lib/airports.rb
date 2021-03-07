require './lib/planes.rb'

class Airport
  attr_reader :capacity, :planes, :weather

  def initialize(airport_code = '***', capacity = 10)
    @capacity = capacity
    @planes = []
    @weather = 5
    @airport_code = airport_code
  end

  def land_plane(plane)
    raise 'Airport full!' if @planes.count >= 10

    raise 'Plane already grounded' if plane.position != 'airbourne'

    @planes << plane
    plane.position = @airport_code
  end

  def plane_take_off(plane)
    raise 'Weather too dangerous!' if @weather >= 7

    raise 'Plane not at this airport!' if plane.position != @airport_code

    @planes.delete(plane)
    plane.position = "airbourne"
  end
end
