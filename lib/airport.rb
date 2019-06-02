require_relative 'plane'

class Airport

  attr_reader :plane

  def land(plane)
    fail 'Airport full' if @plane

    @plane = plane
  end

  def take_off
    fail 'Airport empty' unless @plane

    @plane
  end

  # def plane
    # @plane
  # end
end
