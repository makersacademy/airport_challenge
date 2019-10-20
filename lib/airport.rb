require 'plane'
require 'weather'

class Airport

  def land(plane)
    raise "It is too stormy to land" if stormy?
end

  def take_off(plane)
    raise "it is too stormy for take off" if stormy?
  end

  def full?
  end

  def stormy?
  end

  def has_landed?(plane)
  end
end
