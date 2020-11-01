require_relative 'plane'

class Airport

attr_reader :plane

  def initialize
    @plane = []
  end

  def land(plane)
    fail 'Airport Full' if full?
    @plane << plane
  end

  def take_off(plane)
    @plane.pop
  end

  private
    def full?
      @plane.count >= 10
    end

end
