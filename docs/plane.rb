class Plane

  def initialize(status = "flying")
     @status = status
  end

  def land
    @status = "airport"
  end

  def takeoff
    @status = "flying"
  end

  def status
    @status
  end

end
