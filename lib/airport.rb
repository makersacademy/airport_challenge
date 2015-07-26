require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land plane
    fail 'Airport full' if @planes.count >= 50
    @planes << plane
  end

  def take_off
    fail 'No planes available' if @planes.empty?
    @planes.pop
  end
end
