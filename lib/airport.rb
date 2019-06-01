require_relative './weather.rb'

class Airport

  attr_reader :hanger

  def initialize(capacity = 10)
    @capacity = capacity
    @hanger = []
  end

  def safe?
    @safe
  end

  def full?
    @full
  end

  def sunny?
    @sunny
  end

  def weather
    weather = Weather.new
    weather.generate_weather
  end

  def check_weather
    if weather == 'sunny'
      @sunny = true
    else
      @sunny = false
    end
  end

  def check_capacity
    if @hanger.length == @capacity
      @full = true
    else
      @full = false
    end    
  end

  def set_safety
    check_capacity
    check_weather
    if sunny? && !full?
      @safe = true
    else
      @safe = false
    end
  end

end