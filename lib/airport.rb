require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(weather_report, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather_report = weather_report
    @planes = []
  end

  def land(plane)
    raise "cannot land when airport full" if full?
    raise "cannot land plane when stormy" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "cannot take off when stormy" if stormy?
    raise "plane not at this airport" unless @planes.include?(plane)
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_report.stormy?
  end
end
