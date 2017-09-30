class Airport

  def initialize
    @plane = nil
    @current_forecast = :sunny
  end

  def get_forecast(weather)
    @current_forecast = weather.forecast.to_sym
  end

  def airport_open?
    @current_forecast == :sunny
  end

  def accept_plane(plane)
    fail 'Due to weather conditions landing is not authorized' unless airport_open?
    @plane = plane
  end

  def release_plane
    fail 'Due to weather conditions take off is not authorized' unless airport_open?
    @plane = nil
    true

  end

end
