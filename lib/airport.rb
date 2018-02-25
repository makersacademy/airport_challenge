require_relative 'plane'

class Airport

  def take_off
    fail 'No planes available' unless @plane
    @plane
  end

  def land(plane)
    fail 'Airport is full' if @plane
    @plane = plane
  end

  attr_reader :plane

end
