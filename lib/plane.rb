class Plane

  def take_off
    @land = false
  end

  def land
    @land = true
  end

  def landed?
    @land
  end


end
