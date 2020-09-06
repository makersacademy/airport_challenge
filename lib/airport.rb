class Airport
  attr_reader :hangar, :capacity, :weather
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    rand(6) > 4 ? @weather = "stormy" : @weather = "sunny"
  end

  def land_plane(plane)
    fail "There is no space in the hangar" if room_for_plane

    plane_in_hangar(plane) ? "That plane is already in the hangar" : @hangar << plane
  end

  def take_off_plane(plane)
    fail "That plane is not in the hangar" if !plane_in_hangar(plane)
    fail "You cannot take off whilst the weather is stormy" if @weather == "stormy"

    @hangar.delete(plane)
  end

  private

  def room_for_plane
    @capacity - @hangar.size < 1
  end

  def plane_in_hangar(plane)
    @hangar.include?(plane)
  end
end
