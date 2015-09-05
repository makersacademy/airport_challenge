module PlaneHangar
  attr_writer :capacity

  DEFAULT_CAPACITY = 5
  WEATHER = [:sunny, :stormy]

  def planes
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def landing_plane(plane)
    fail "The Airport is full" if full?
    fail "Bad weather conditions" if stormy?
    planes << plane
  end

  def taking_off_plane
    fail "No planes at the airport" if empty?
    fail "Bad weather conditions" if stormy?
    planes.pop
  end

  # def planes_count
  #   planes.length
  # end

  private

  def full?
    planes.length >= capacity
  end

  def empty?
    planes.empty?
  end

  def weather_forecast
    WEATHER.sample
  end

  def stormy?
    weather_forecast == :stormy
  end

end
