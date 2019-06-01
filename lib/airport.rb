require_relative './weather.rb'

class Airport

  def initialize(capacity = 10)
    set_safety
    @capacity = capacity
    @hanger = []
  end

  def safe?
    @safe
  end

  def full?
    true  
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