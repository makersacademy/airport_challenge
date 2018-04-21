class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  attr_accessor :capacity

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane, is_stormy = false)
    fail 'Plane already in airport' if @hangar.include?(plane)
    fail 'Cannot land in stormy weather' if is_stormy
    fail 'Airport full' if full?
    plane.land
    @hangar << plane
  end

  def take_off(plane, is_stormy = false)
    fail 'No planes in airport' if @hangar.length <= 0
    fail 'Plane not in airport' unless @hangar.include?(plane)
    fail 'Cannot take off in stormy weather' if is_stormy
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    plane.take_off
    return plane
  end

  def confirm_left_airport(plane)
    return !@hangar.include?(plane)
  end

  private

  def full?
    return @hangar.length == @capacity
  end

end
