require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if @planes.count >= 5

    @planes << plane
  end

  def take_off
    fail 'Airport empty' if @planes.empty?

    @planes.pop
  end

  # def plane
    # @plane
  # end
end
