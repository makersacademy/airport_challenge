require_relative './weather.rb'

class Airport

  attr_reader :hanger

  def initialize(capacity = 10)
    set_safety
    @capacity = capacity
    @hanger = []
    @full = false
  end

  def safe?
    @safe
  end

  def full?
    @full
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

  def check_capacity
    if @hanger.length == @capacity
      @full = true
    else
      @full = false
    end    
  end

end