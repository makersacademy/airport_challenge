class Plane

  def initialize
    @status = false
  end

  def at_airport?
    @status
  end

  def landed
    @status = true
  end
    

end
