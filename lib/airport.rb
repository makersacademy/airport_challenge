class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "There is no space in the hangar" if room_for_plane

    @hangar << plane
  end

  def take_off_plane(plane)
    @hangar.delete(plane)
  end

  def weather
    rand(6) > 4 ? "stormy" : "fine"
  end

  private

  def room_for_plane
    @capacity - @hangar.size < 1
  end

end
