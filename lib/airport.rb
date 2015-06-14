require_relative 'plane'

# As a pilot
# So that I can set off for my specified destination
# I would like to be able to take off from the appropriate airport

# As an air traffic controller
# So that I can avoid accidents
# I want to be able to prevent airplanes landing when the weather is stormy

class Airport

  DEFAULT_CAPACITY = 100

  attr_accessor :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def receive_plane plane
    fail 'The airport is full!' if full?
    planes << plane
  end

  def release_plane
    # Plane.new
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

end
