require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def weather_selector
    rand(1..6)
  end

  def stormy?
    if weather_selector == 6
      return true
    else
      return false
    end
  end

  def release_plane
    fail "No planes at the airport to take off" if empty?
    planes.pop
  end

  def land(plane)
    fail "Airport is full" if full?
    planes << plane
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end
