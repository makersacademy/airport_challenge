class Airport
  attr_accessor :hangar
  attr_accessor :weather

  def initialize(default_capacity = 1)
    @hangar = []
    @CAPACITY = default_capacity
    @weather = randomise_weather
  end

  def take_in_plane(plane)
    fail "stormy conditions" if @weather == 'stormy'
    fail 'DOCKED ALREADY' if plane.dock_status == true
    fail 'full' if full?
    plane.dock
    @hangar.push(plane)
  end

  # I did not end up using stubs to override randomness
  #  I just couldn't get the syntax right!
  def randomise_weather
    if rand(10).ceil <= 2
      @weather = 'stormy'
    else
      @weather = 'fair'
    end
  end

  def part_with_plane_at_pos(plane_pos)
    fail "stormy conditions" if @weather == 'stormy'
    @hangar[plane_pos].undock
    @hangar.delete_at(plane_pos)
  end

  def empty?
    return @hangar.length == 0
  end

  def full?
    return @hangar.length == @CAPACITY
  end
end
