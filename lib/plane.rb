class Plane
  def initialize
    @in_air = true
  end
  attr_reader :in_air

  def land
    @in_air = false
  end
end
