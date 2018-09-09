class Airport
  attr_accessor :hangar, :capacity
  attr_reader :name
  def initialize(name, capacity = 1)
    @hangar = []
    @name = name
    @capacity = capacity
  end

  def instruct_landing(plane)
    raise "Full capacity. Keep flying buddy." if capacity_full?
    store_plane(plane)
  end
  def store_plane(plane)
     @hangar << plane
  end

  def take_off

  end

  def stormy?
  end

  def capacity_full?
    hangar.length >= capacity
  end
end
