require_relative './weather'

class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    @landed = true
  end
end
