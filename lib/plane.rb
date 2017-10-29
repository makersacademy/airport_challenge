class Plane
  attr_reader :status

  def initialize(status = "grounded")
    @status = status
  end

  def land(airport)
  end

  def takeoff
    @status = 'airbourne'
  end

end
