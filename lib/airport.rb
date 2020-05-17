require_relative 'plane'

class Airport

  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane)
    fail "Airport Full!" if full?

    @hanger << plane
  end

  def take_off(plane)
    @hanger = nil
  end

  def depart(plane)
    @hanger.delete(plane)
    plane_departed(plane)
  end

  def plane_departed(plane)
    puts "#{plane} departed"
  end

  def full?
    @hanger.count > 10
  end
end
