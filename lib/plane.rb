class Plane

  attr_reader :flying

  def takeoff
    @flying = true
  end

  def land
    @flying = false
  end

end
