require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50

attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def take_off(plane)
    return true if plane.flying == false #meaning if plane is not flying it can take off
  end

  def receive_plane(plane)
    @planes << plane
  end

  def is_empty?
    @planes.empty?
  end

  # def planes_at_airport
  #   @planes.count
  # end

end
