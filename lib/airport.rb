class Airport
  attr_accessor :hangar
  attr_accessor :weather

  def initialize(default_capacity = 1)
    @hangar = []
    @CAPACITY = default_capacity
    @weather = 'fair'
  end

  def take_in_plane(plane)
    fail "stormy conditions" if @weather == 'stormy'
    fail 'DOCKED ALREADY' if plane.dock_status == true
    fail 'full' if full?
    plane.dock
    @hangar.push(plane)
  end

  def sudden_bad_weather
      @weather = 'stormy'
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
