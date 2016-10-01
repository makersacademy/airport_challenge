class Plane

  attr_reader :status, :airport

  def initialize
    @status = "flight in progress"
    @airport = nil
  end

  def confirm_status
    "Plane status:  #{@status}"
  end

  def land(airport)
    raise "This plane is not in flight" if @status == "landed"
    airport.accept_plane(self)
    @status = "landed"
    @airport = airport
  end

  def take_off
    raise "This plane is already in flight" if @status == "flight in progress"
    @airport.plane_departs(self)
    @status = "flight in progress"
    @airport = nil
  end

end
