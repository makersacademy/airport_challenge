require_relative 'plane'

class Airport

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

  def initialize
  @weather = [sunny, sunny, sunny, sunny, sunny,
              sunny, sunny, sunny, stormy, stormy]
  end

  def stormy
  return @weather.sample
  end

end
