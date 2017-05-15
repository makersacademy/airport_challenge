require_relative 'plane'

class Airport

  def land(plane)
    raise "Unsafe conditions, landing not permitted" if stormy
    plane
  end

  def take_off(plane)
    raise "Unsafe conditions, take-off not permitted" if stormy
    nil
  end

  def stormy
    true
  end

end
