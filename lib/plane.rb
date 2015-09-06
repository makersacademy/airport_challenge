class Plane

  attr_reader :landed, :location

  def initialize
    @landed = false
  end

  def land(airport)
    @landed = true
    @location = airport
  end

  def landed?
    landed
  end

end
