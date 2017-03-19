class Plane

  attr_reader :landed

  def initialize()
    @landed = false
  end

  def in_airport?
    return true if landed == true
    return false if landed == false
    fail "Error"
  end

  def land
    @landed = true
  end

  def take_off
    @landed = false
  end
end
