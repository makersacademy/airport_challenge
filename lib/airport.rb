# class Destination
# end

require './lib/plane'

class Airport

  def initialize
    @planes = []
    @weather = ["Sunny", "Stormy"]
  end

  attr_reader :planes, :weather, :flying

  def land?(plane)
    fail "Plane is already grounded" if grounded
    @planes[0] << plane
  end

  def take_off?
    fail "Cannot fly due to weather" if stormy?
    @planes.shift
  end

  def stormy?
    @weather.sample
  end

private

  def in_air
    self.flying = try
  end

  def grounded
    !flying
  end

end
