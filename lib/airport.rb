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
    raise "Cannot depart due to stormy weather" if weather == "Stormy"
    
    @hangar.pop
  end

  def weather
    Weather.new.forecast
  end

end
