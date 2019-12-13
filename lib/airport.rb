require_relative 'plane'

class Airport
  attr_reader :hanger

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane)
    @hanger.push(plane)
    true
  end

  def take_off(plane)
    @hanger.delete(plane)
    true
  end
end
