require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail 'Unable to land' if unsafe
    @hangar << plane
  end

  def takeoff
    fail 'Unable to takeoff' if empty?
  end

  private

  def empty?
    @hangar.empty?
  end

  def unsafe(weather = Weather.new)
    weather.random_condition == :stormy ? true : false
  end

end
