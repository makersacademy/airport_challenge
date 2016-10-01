require_relative 'airport'

class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def land
    @landed = true
  end

end
