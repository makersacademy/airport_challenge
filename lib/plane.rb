class Plane

  attr_reader :status

  def initialize(status = "flying")
    @status = status
  end

  def land(airport)
  end

  def takeoff
  end
end
