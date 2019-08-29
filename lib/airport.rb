require_relative "plane"
require_relative "weather"

class Airport
  include Weather
  DEFAULT_CAPACITY = 2

  attr_reader :hanger, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def receive_plane(plane)
    fail 'Conditions not safe to land' unless condition?
    fail 'Airport full' if full?

    @hanger << plane
  end

  def release_plane(plane)
    fail 'Weather bad, no fly zone' unless condition?
    fail 'Plane not in the hanger' if (@hanger.include?(plane) == false)

    @hanger.delete(plane)
  end

  private

  def full?
    @hanger.size >= @capacity
  end
end
