require_relative './weather.rb'

class Airport

  attr_reader :hanger

  def initialize(capacity = 10)
    @capacity = capacity
    @hanger = []
  end

  def clear_for_take_off(plane)
    if check_weather && check_hanger(plane)
      true
    else
      false
    end
  end

  def clear_for_landing(plane)
    if check_weather && !check_hanger(plane) && !check_capacity
      true
    else
      false
    end
  end

  def weather
    weather = Weather.new
    weather.generate_weather
  end

  def check_weather
    weather == 'sunny' ? true : false
  end

  def check_capacity
    @hanger.length == @capacity ? true : false 
  end

  def check_hanger(plane)
    @hanger.include?(plane)
  end

  def land(plane)
    clear_for_landing(plane) ? @hanger << plane : puts('Plane not able to land')
  end

  def take_off(plane)
    clear_for_take_off(plane) ? @hanger.delete(plane) : puts('Plane not able to take off')
  end


end