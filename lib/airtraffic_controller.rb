require_relative 'plane'

class Airport
  attr_accessor :hanger

  def initialize
    @hanger = []
  end

  def weather_condition(conditions)
    @weather = conditions
  end

  def prevent
    @weather == 'stormy'
  end

  def land(plane)
    @hanger << plane
  end

  def take_off(plane)
    fail RuntimeError, "Stormy weather all flights grounded!" if prevent == true
    @hanger.delete(plane)
    @hanger
  end

  def check(plane)
    @hanger.include?(plane)
  end

end
