require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport full" if full?

    @planes << plane
  end

  def take_off
    fail "No planes" if empty?

    @planes.pop
    "The plane is in the air"
  end

  private

  def full?
    @planes.length >= 10
  end

  def empty?
    @planes.empty?
  end
end
