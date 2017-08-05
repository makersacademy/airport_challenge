class Plane

  attr_accessor :status

  def initialize(status = "in the airport")
    @status = status
  end

  def land
    "plane has landed"
  end

  def take_off
    "plane has taken off"
    @status = "in the air"
  end

end
