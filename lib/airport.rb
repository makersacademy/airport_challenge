require_relative 'plane'

class Airport
  attr_accessor :capacity, :planes_now

  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes_now = []
  end

  def allow_landing(plane)
    @planes_now << plane
    puts "#{plane} has landed"
  end
end
