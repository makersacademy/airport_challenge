require './lib/plane.rb'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'Airport full!' if @planes.length >= @capacity

    @planes.push(plane)
  end

  def take_off
    fail 'No planes left!' if @planes.empty?

    @planes.pop()
  end

end
