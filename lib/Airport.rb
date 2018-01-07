class Airport
  require_relative 'plane'
  require_relative 'weather'

  attr_reader :airport
  attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather
  end

  def land(plane)
    @airport = plane
  end

  def take_off(plane)
    raise 'Unable to take off as stormy weather.' if weather.stormy?
    @airport = nil
    take_off_confirmation(plane)
  end

private
  def take_off_confirmation(plane)
    "#{plane} no longer in airport."
  end

end
