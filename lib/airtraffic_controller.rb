require_relative 'plane'

class Airport
  attr_accessor :hanger
  MAXCAP = 2

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
    fail RuntimeError, "Stormy weather all flights diverted!" if prevent == true
    fail RuntimeError, "Airport at capacity!" if MAXCAP < (@hanger.length + 1)
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
