require_relative 'plane'

class Airport

  def land plane
    plane.lands!
    true
  end

  def take_off plane
    true
  end
end