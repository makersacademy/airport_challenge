class Planes

  def initialize
    @land = false
  end

  def landed
    @land = true
  end

  def taken_off
    @land = false
  end

  def at_airport?
    @land
  end

end
