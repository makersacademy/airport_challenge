require_relative 'plane'

class Airport

  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def takeoff
    @hanger.pop
    raise "stop" if weather == true
  end

  def land(plane)
    @hanger << plane
    raise "stop" if weather == true
  end

  def weather
    true
  end

end
