require_relative 'plane.rb'

class Airport

  def initialize
    @capacity = 10
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
