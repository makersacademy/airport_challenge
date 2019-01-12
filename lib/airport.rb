require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :airport_weather

  def initialize(airport_weather = Weather.new)
    @airport_arr = Array.new
    @airport_weather = airport_weather
  end

  def land
    @airport_arr.push(Plane.new)
  end

  def take_off
    if @airport_weather.stormy?
      raise "You cannot take off in a stormy weather!"
    else
      @airport_arr.pop
      return "Plane took off!"
    end
  end

end
