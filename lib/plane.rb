class Plane

  attr_reader :airborne

  def initialize
    @airborne = false
  end

  def update_plane_status(status)
    status == :airborne ? self.airborne = true : self.airborne = false
  end

  def airborne?
    airborne
  end

  private
  attr_writer :airborne

end
