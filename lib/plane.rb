class Plane
# describes the plane only and its methods
  public

  attr_reader :airborne

  def initialize
    @airborne = true
  end

  def land_plane
    self.airborne = false
  end

  def take_off_plane
    self.airborne = true
  end


  private

  attr_writer :airborne

end
