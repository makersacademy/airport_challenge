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
    if check_weather && !check_hanger(plane) && !check_capacity && !plane.at_airport
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
    weather == 'sunny'
  end

  def check_capacity
    @hanger.length == @capacity 
  end

  def check_hanger(plane)
    @hanger.include?(plane)
  end

  def land(plane)
    if clear_for_landing(plane)
      @hanger << plane
      plane.in_hanger
    else
      puts('Plane not able to land')
    end
  end

  def take_off(plane)
    if clear_for_take_off(plane)
      @hanger.delete(plane)
      plane.not_in_hanger
    else
      puts('Plane not able to take off')
    end
  end

end
