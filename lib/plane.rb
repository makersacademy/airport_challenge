class Plane
  attr_reader :status
  
  def land
    @status = 'landed'
  end

  def takeoff
    @status = 'inflight'
  end

end
