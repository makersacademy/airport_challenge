require_relative 'plane'

class Airport

  def land(plane)
    raise 'Unable to land: Weather is stormy' if stormy?
  end

  def take_off(plane)
    raise 'Unable to take off: Weather is stormy' if stormy?
  end


private

  def stormy?
    rand(1..6) > 4
  end
end
