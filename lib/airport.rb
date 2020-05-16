require_relative 'plane.rb'
require_relative 'weather.rb'

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

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

end
