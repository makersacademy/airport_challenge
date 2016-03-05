class Airport

  private

  def release plane
    @plane_list.delete plane
    plane.takeoff
  end

  def capture plane
    plane.land
    @plane_list << plane
  end

  def check_weather
    raise 'Denied. weather is Stormy' if @local_weather.current_weather == :stormy
  end

  public

  def initialize(weather)
    @plane_list = []
    @local_weather = weather
  end

  def land_airplane plane
    check_weather
    capture plane
  end

  def launch_airplane plane
    check_weather
    release plane
  end

  def list_airplanes
    @plane_list
  end

end
