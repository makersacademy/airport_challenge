class Plane
  attr_accessor :in_air

  def initialize
    @in_air = true
  end

  def in_air?
    @in_air
  end

  def ground
    @in_air = false
  end

  def airborn
    @in_air = true
  end 

end
