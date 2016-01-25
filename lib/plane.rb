require_relative "airport"

class Plane

  attr_reader :landed

  def initialize
    @landed = true
  end

  def fly
    @landed = false
  end

  def land
    @landed = true
  end

end
