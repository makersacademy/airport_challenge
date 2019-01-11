# to do
# change take_offandlandstatus to can_take_off_and_land?
class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :DEFAULT_CAPACITY

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def can_land?
    is_stormy? || is_full? ? false : true
  end

  def can_take_off?
    is_stormy? ? false : true
  end

  def plane_landing(plane)
    @planes.append(plane)
    self
  end

  def change_capacity(new_capacity)
    @capacity = new_capacity
    self
  end

  def plane_taking_off(plane)
    @planes.delete(plane)
    self
  end

  def plane_entering_on_ground(plane)
    @planes.append(plane)
    self
  end

  private

  def is_full?
    @planes.length >= @capacity
  end

  def is_stormy?
    rand(1..100) < 5 ?  true : false
  end
end
