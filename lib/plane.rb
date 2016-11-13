require_relative 'weather'

class Plane
attr_reader :landed

  def initialize(landed = false)
    @landed = landed
  end

  def land
    fail "Plane is already on the ground." if @landed == true
    @landed = true
  end

  def take_off
    @landed = false
  end

end
