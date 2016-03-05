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

  def check_weather weather_dispatcher
    raise 'Denied. weather is Stormy' if weather_dispatcher.current_weather == :stormy
  end

  public

  def initialize
    @plane_list = []
  end

  def land_airplane plane, weather_dispatcher
    check_weather weather_dispatcher
    capture plane
  end

  def launch_airplane plane, weather_dispatcher
    release plane
  end

  def list_airplanes
    @plane_list
  end

end
