require 'plane'
require 'weather'

class Airport

  def land(plane)
end

  def take_off(plane)
    raise "it is too stormy for take off" if stormy?
  end

  def stormy?
  end
end
