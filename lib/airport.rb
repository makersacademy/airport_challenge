require_relative './weather.rb'

class Airport

  def initialize(capacity)
    set_safety
    @capacity = capacity
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