require_relative 'plane'

class Airport

  attr_reader :landed

  def initialize
    @landed = []
  end

  def takeoff
    @landed.pop
    raise "stop" if weather == true
  end

  def land(plane)
    @landed << plane
    raise "stop" if weather == true
  end

  def weather
    true
  end

end
