require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    @planes << plane
  end

  # def take_off
  #   @planes.shift
  # end

  def is_empty?
    @planes.empty?
  end

end
