require './lib/plane.rb'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    fail 'Airport full!' if full? == true

    @planes.push(plane)
  end

  def request_take_off(plane)
    fail 'No planes left!' if empty? == true

    @planes.delete(plane)

  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty? == true
  end

end
