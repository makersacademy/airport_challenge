class Plane

  def initialize
    @airborne = true
  end


  def flying?
    @airborne
  end

  def land!
    @airborne = false
  end

end
