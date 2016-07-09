require_relative 'airport'

class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Plane is not in flight' if landed == true
    @landed = true
  end

  def take_off
    fail 'Plane is already in flight' if landed == false
    @landed = false
  end

end
