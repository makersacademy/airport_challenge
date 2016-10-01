class Plane

  attr_reader :status

  def initialize
    @status = "flight in progress"
  end

  def confirm_status
    "Plane status:  #{@status}"
  end

  def land(airport)
    airport.accept_plane(self)
    @status = "landed"
  end

  def take_off
    airport.plane_departs(self)
    @status = "flight in progress"
  end

end
