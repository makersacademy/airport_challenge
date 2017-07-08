require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :capacity

  def initialize(weather = Weather.new)
    @weather = weather
  end

  def landing_clear?
    true unless full? || weather.stormy?
  end

  def takeoff_clear?
    raise 'Negative. Cancel take-off because of the weather.' if @weather.stormy?
    true
  end


end
