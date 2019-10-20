require_relative 'plane'

class Airport
  def land(plane)
  end

  def take_off(plane)
  end

  def stormy?
    rand(1..6) > 4
  end
end