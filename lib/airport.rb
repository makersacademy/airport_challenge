class Airport

  private

  def release plane
    plane.takeoff
  end

  def capture plane
    plane.land
  end

  public
  def initialize
    @plane_list = []
  end

  def land_airplane plane
    @plane_list << plane
    capture plane
  end

  def launch_airplane plane
    @plane_list.delete plane
    release plane
  end

  def list_airplanes
    @plane_list
  end
end
