class Plane

  attr_accessor :in_air

  def initialize
    @in_air = true
  end

  def land
    @in_air = false
  end

  def takeoff
    @in_air = true
  end

  def flying?
    @in_air
  end

end
