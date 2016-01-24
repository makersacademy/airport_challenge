require_relative "airport"

class Plane

  attr_reader :plane, :airport, :landed

  def initialize
    @landed = true
  end

  def fly
    @landed = false
  end

  def land(airport)
    @landed = true
  end

end
