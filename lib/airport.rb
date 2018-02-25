class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def dock_plane(plane)
    @hangar.push(plane)
  end

  def release_plane(plane)
    @hangar.delete(plane)
  end

end
