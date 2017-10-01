class Airport

  attr_reader :capacity, :planes

  def initialize(capacity = 20, planes = [])
    @planes = planes
    @capacity = capacity
    @current_forecast = :sunny
  end

  def analyze_forecast(weather)
    @current_forecast = weather.forecast.to_sym
  end

  def open?
    @current_forecast == :sunny
  end

  def accept_plane(plane)
    fail 'Due to weather conditions landing is not authorized' unless open?
    @planes << plane
  end

  def release_plane(plane)
    fail 'Due to weather conditions take off is not authorized' unless open?
    @planes.delete(plane)
    true

  end

end
