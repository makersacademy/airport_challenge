require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def land_plane(plane)
    fail "Hanger is full" if full?
    hanger << plane
  end

  def take_off_plane(plane)
    true
  end

  private

  attr_reader :hanger

  def full?
    hanger.length >= @capacity
  end

end
