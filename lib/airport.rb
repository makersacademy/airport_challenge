require_relative './weather.rb'

class Airport

  attr_reader :hanger

  def initialize(capacity = 10)
    @capacity = capacity
    @hanger = []
  end

  # def safe?
  #   @safe
  # end

  def full?
    @full
  end

  def sunny?
    @sunny
  end

  def clear_for_take_off?
    @clear_for_take_off  
  end

  def clear_for_landing?
    @clear_for_landing
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

  def set_take_off_safety
    check_weather
    if sunny?
      @clear_for_take_off = true
    else
      @clear_for_take_off = false
    end
  end

  def set_landing_safety
    check_capacity
    check_weather
    if sunny? && !full?
      @clear_for_landing = true
    else
      @clear_for_landing = false
    end
  end

end