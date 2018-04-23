class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  attr_accessor :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane, is_stormy = false)
    fail 'Plane already in airport' if hangar_contains(plane)
    fail 'Cannot land in stormy weather' if is_stormy
    fail 'Airport full' if airport_full?
    dock(plane)
  end

  def take_off(plane, is_stormy = false)
    fail 'No planes in airport' if hangar_empty?
    fail 'Plane not in airport' unless hangar_contains(plane)
    fail 'Cannot take off in stormy weather' if is_stormy
    launch(plane)
    plane
  end

  def confirm_left_airport(plane)
    !@hangar.include?(plane)
  end

  private

  def hangar_contains(plane)
    @hangar.include?(plane)
  end

  def airport_full?
    @hangar.length >= @capacity
  end

  def dock(plane)
    plane.land
    @hangar << plane
  end

  def hangar_empty?
    @hangar.length.zero?
  end

  def launch(plane)
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    plane.take_off
  end

end
