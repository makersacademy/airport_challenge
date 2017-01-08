class Plane
  attr_accessor :status

  def land
    @status = 'landed'
  end

  def takeoff
    @status = 'inflight'
  end

end
