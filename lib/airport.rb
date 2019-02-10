require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes_landed, :current_weather, :weather
  attr_accessor :weather, :current_weather

  def initialize()
    @planes_landed = []
    @weather = Weather.new
    #@current_weather = weather.weather_now?
  end

  def land(plane)
    @planes_landed << plane
  end

  def take_off(plane)
    if @weather.stormy_currently? == true
      fail 'cannot take off when stormy'
    else
      @planes_landed.delete(plane)
    end
  end

end
