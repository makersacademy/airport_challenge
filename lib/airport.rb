require_relative 'plane'

class Airport

  attr_reader :hanger

  DEFAULT_CAPACITY = 15

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
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

  private

  def plane_departed(plane)
    puts "#{plane} departed"
  end

  def full?
    @hanger.count >= @capacity
  end
end
