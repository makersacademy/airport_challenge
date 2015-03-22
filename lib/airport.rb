require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :planes
  def initialize
    @planes = []
    @capacity = 6
  end

  def land(plane)
    fail 'The plane cannot land' if full?
    planes << plane
  end

  def take_off
    fail 'The plane cannot take off' if empty?
    planes.pop
  end

  # def planes_landed
  #   planes.select { |plane| plane.landed }.length
  # end

  def empty?
    planes.empty?
  end

  def full?
    planes.length == capacity
  end
end

# airport = Airport.new

# # p airport.land('1')
# # p airport.empty?
# p planes_landed
# # p airport.take_off
