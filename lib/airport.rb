require_relative 'weather'

class Airport
  attr_reader :apron
  attr_reader :capacity

  def initialize(capacity = 5)
    @weather = Weather.new
    @capacity = capacity
    @apron = []
  end

  def stormy?
    @weather.current == "stormy"
  end

  def full?
    @apron.count >= @capacity
  end

  def add_plane(plane)
    raise("Airport is at capacity") if full?

    @apron << plane
  end

  def remove_plane(plane)
    @apron.delete(plane)
  end
end
