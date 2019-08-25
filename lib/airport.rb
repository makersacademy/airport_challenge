class Airport

  attr_accessor :planes

  def initialize(weather)
    @weather = weather
    @planes = []
  end

  def track_plane(plane)
    @planes << plane
  end

  def instruct_landing(plane)
    fail "Stormy conditions" if stormy?
    plane.land
  end

  def instruct_take_off(plane)
    fail "Stormy conditions" if stormy?
    plane.take_off
    @planes.pop
  end

private

  def stormy?
    @weather.weather_condition == :stormy
  end

end
