require_relative 'plane.rb'

class Airport

  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @airport = []
  end

  def land(plane)
    raise "Airport full" if capacity_check

    @airport << plane
  end

  def take_off
    puts 'Plane has taken off'
  end

  private

  def capacity_check
    @airport.count >= @capacity
  end

end
