class Plane

  attr_reader :location

  def initialize
    @location = "air"
  end

  def take_off
    @location = "air"
  end

  def land
    @location = "airport"
  end

end