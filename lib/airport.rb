
class Airport
  attr_reader :initialize
  def initialize
  @hanger = []
  end

  def land(plane)
  @hanger << Plane.new
  end

  def takeoff(plane)
  @hanger.slice!(0)
  end

end

class Weather
  attr_reader :initialize
  def initialize
  @weather = [sunny, sunny, sunny, sunny, sunny,
              sunny, sunny, sunny, stormy, stormy]
  end

  def stormy
  return @weather.sample
  end

end


class Plane

end
