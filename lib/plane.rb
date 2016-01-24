class Plane

  def initialize
    @in_air = true
  end
  
  def landed?
    @in_air = false
  end

  def in_air?
    @in_air = true
  end

end
