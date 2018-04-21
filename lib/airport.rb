require 'plane'

class Airport
  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  def land_plane(plane)
    "#{plane} plane landed"
  end
end
