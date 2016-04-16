class Plane

  attr_reader :landed_status

  def initialize
    @landed_status = false
  end

  def landed
    @landed_status = true
  end

  def take_off
    @landed_status = false
  end

end