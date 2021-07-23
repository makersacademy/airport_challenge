class Airport

  attr_reader :landing_strip, :capacity, :weather, :DEFAULT_CAPACITY
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landing_strip = []
    @capacity = capacity
    @weather = self.weather_forecast
  end

  def land(flight)
    fail 'Sorry we are full' if full?
    fail 'Weather warning. Cannot land.' if @weather == :stormy

    @landing_strip << flight
  end

  def take_off(flight)
    fail 'Weather warning. Cannot take-off.' if @weather == :stormy

    @landing_strip.delete(flight)
    @landing_strip
  end

  private

  def full?
    @landing_strip.count >= @capacity
  end

  def weather_forecast
    [:sunny, :sunny, :sunny, :stormy].shuffle.pop
  end

end
