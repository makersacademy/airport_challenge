require_relative 'weather.rb'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def take_off
    @hangar.pop
  end

  def weather
    Weather.new.forecast
  end

end
