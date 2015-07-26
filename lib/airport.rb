require_relative 'plane'

class Airport

  def land plane
    @plane = plane
  end

  def take_off
    fail 'No planes available' unless @plane
    @plane
  end
end
