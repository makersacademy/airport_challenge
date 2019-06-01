require_relative './weather.rb'

class Airport

  def initialize
    @safe
  end

  def safe?
    @safe
  end

  def weather
    weather = Weather.new
    weather.generate_weather
  end

  def set_safety
    if weather == 'sunny'
      @safe = true
    else
      @safe = false
    end
  end

end