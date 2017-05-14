class Plane

  attr_reader :on_ground, :location

  def initialize
    @on_ground = true
    @location = ""
  end                              

  def land(airport)
    @on_ground = true
    @location = airport
    self
  end

  def takeoff(destination)
    @on_ground = false
    @location = "air"
    self
  end

end