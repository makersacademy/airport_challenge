class Plane
  attr_reader :in_air

  def initialize
    @in_air = true
  end

  def landed
    @in_air = false
  end

  def departed
    @in_air = true
  end

end
