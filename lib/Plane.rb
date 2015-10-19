class Plane
  attr_reader :status

  def initialize
    @status = false #true for in the air, false for on the ground
  end

  def land
    @status = false
  end

  def take_off
    @status = true
  end

end
