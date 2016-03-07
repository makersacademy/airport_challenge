class Airport

  private

  DEFAULT_CAPACITY = 20

  def release plane
    @plane_list.delete plane
    plane.takeoff
  end

  def capture plane
    plane.land self
    @plane_list << plane
  end

  def check_weather
    raise 'Denied. Stormy weather.' if @local_weather.current_weather == :stormy
  end

  def check_capacity
    raise 'Denied. Full airport.' if @plane_list.length >= @capacity
  end

  public

  def initialize weather, cap = DEFAULT_CAPACITY
    @plane_list = []
    @local_weather = weather
    @capacity = cap
  end

  def land_airplane plane
    check_weather
    check_capacity
    capture plane
  end

  def launch_airplane plane
    check_weather
    release plane
  end

  def list_airplanes
    @plane_list
  end

  def wait_for_weather new_weather = nil
    @local_weather.change_weather new_weather
  end

end
