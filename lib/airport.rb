class Airport

  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = 20, planes = [])
    @planes = planes
    @capacity = capacity
    @forecast = :sunny
  end

  def analyze_forecast(weather)
    @forecast = weather.forecast
  end

  def accept_plane(plane)
    fail 'Due to weather conditions landing is not authorized' unless open?
    fail 'Airport is at capacity. Landing is not authorized' unless !full?
    plane.land
    @planes << plane
  end

  def release_plane(plane)
    fail 'Due to weather conditions take off is not authorized' unless open?
    plane.take_off
    @planes.delete(plane)
    true

  end

  private

  def full?
    @planes.count >= @capacity
  end

  def open?
    @forecast == :sunny
  end
end
