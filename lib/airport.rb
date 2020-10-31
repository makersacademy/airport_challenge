require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport full" unless @planes.length < 10

    @planes << plane
  end

  def take_off
    fail "No planes" if @planes.empty?

    @planes.pop
    "The plane is in the air"
  end
end
