require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :planes, :stormy
  attr_reader :capacity
  def initialize
    @planes = []
    @stormy = [false, true, false, false].sample
    @capacity = DEFAULT_CAPACITY
  end

  def confirm_departure(plane)
    return "#{plane} is still grounded" if plane.grounded_in?(self)

    return "#{plane} has departed"
  end

  def full?
    @planes.length >= @capacity
  end
end
