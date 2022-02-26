require_relative 'plane'

class Airport

  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport capacity reached. No more landing allowed." if full?
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  private

  def full?
    true if @planes.length == 1
  end
end
