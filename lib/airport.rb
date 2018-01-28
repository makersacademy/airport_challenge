require_relative 'plane'

class Airport
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def land(plane)
    storage << plane
    "#{plane} has now landed."
  end

  def takeoff(plane)
    storage.delete(plane)
    "#{plane} has now taken off"
  end
end
