class Plane

  attr_reader :on_ground, :location, :tail_number

  def initialize(tail_number)
    @tail_number = tail_number
    @on_ground = true
    @location = "air"
  end

  def land(airport)
    @on_ground = true
    @location = airport.iata_code
    self
  end

  def takeoff(destination)
    @on_ground = false
    @location = "air"
    @destination = destination
    self
  end
end
