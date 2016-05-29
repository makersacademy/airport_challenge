require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def dock(plane, weather)
    self.check_weather(weather)
    @planes << plane
  end

  def check_for_landed(plane)
    @planes.include? plane
  end

  def release(plane, weather)
    self.check_weather(weather)
    @planes.delete(plane)
  end

  def check_weather(weather)
    raise 'No planes can take off in a storm' if weather.stormy?
  end
end
