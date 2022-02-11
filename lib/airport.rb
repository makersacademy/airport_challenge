require 'plane'

class Airport

  attr_accessor :capacity
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land_plane(plane)
    @planes << plane unless stormy || @planes.length >= DEFAULT_CAPACITY
    "Successful Landing"
  end

  def take_off(plane)
    @planes.delete(plane) unless stormy || @planes.empty?
  end

  private

  def stormy
    condition = rand(6)
    condition == 4
  end

end
