class Plane

  def initialize
    @grounded = false
  end

  def take_off
    @grounded = false
  end

  def land
    @grounded = true
  end

  def in_airport?
    @grounded
  end


end
