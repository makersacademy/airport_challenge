require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    if @planes.length >= 10
      raise "Airport full"
    elsif @planes.include?(plane)
      raise "This plane is already in the airport"
    else
      @planes << plane
    end
  end

  def take_off(plane)
    if @planes.empty?
      raise "This plane is not in the airport"
    elsif !@planes.include?(plane)
      raise "This plane is not in the airport"
    else
      @planes.delete(plane)
    end
  end

  def weather_check
    todays_weather = Weather.new
    todays_weather.forecast
  end

end
