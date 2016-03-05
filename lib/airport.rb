class Airport

  private
  @plane_list

  def set_airborne plane
    plane.takeoff
  end

  def set_landed plane
    plane.land
  end

  public
  def initialize
    @plane_list = []
  end

  def land_airplane plane
    @plane_list << plane
    set_landed plane
  end

  def launch_airplane plane
    @plane_list.delete plane
    set_airborne plane
  end

  def list_airplanes
    @plane_list
  end
end
