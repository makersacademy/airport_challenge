class Airport

  SLOT_LIMIT = 30
  attr_accessor :slots, :weather

  def initialize
    @slots = []
    @weather = "sunny"
  end

  def land(plane)
    fail "Weather conditions too dangerous for landing" if @weather == "stormy"
    if full? then fail "All airport landing slots currently occupied" else @slots.push(plane) end
  end

  def takeoff(slot_number)
    fail "Weather conditions too dangerous for take-off" if @weather == "stormy"
    @slots.delete_at(slot_number)
  end

  def full?
    true if @slots.count >= SLOT_LIMIT
  end

end
