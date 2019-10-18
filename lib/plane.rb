class Plane
  attr_reader :landed, :location

  def initialize
    @landed = false
    @location = "Factory"
  end

  def land(destination)
    @landed = true
    @location = destination
  end
end
