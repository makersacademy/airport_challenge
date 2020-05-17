require_relative 'plane'

class Airport

  attr_reader :hanger

  def land(plane)
    @hanger = plane
  end

  def take_off(plane)
    @hanger = nil
  end
end
