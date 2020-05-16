require_relative 'plane'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    fail "Airport at capacity" if full?
    @planes.push(plane)
  end

  def depart(plane)
    @planes.delete(plane)
    plane_left_notification(plane)
  end

private

  def plane_left_notification(plane)
    puts "#{plane} has left the airport"
  end

  def full?
    @planes.count >= @capacity 
  end

end
