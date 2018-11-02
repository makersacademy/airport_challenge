require_relative 'airport'

class Plane
  attr_accessor :landed

  def land
    landed = true
  end
  def take_off
  end
end
