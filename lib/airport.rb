class Airport
  attr_writer :capacity
  DEFAULT_CAPACITY = 20
  def initialize
    @hangar_log = 0
    @capacity = DEFAULT_CAPACITY
  end

  def plane_landed
    fail "airport full" unless @hangar_log < @capacity
    @hangar_log += 1
  end

  def plane_take_off
    @hangar_log -= 1
  end
end
