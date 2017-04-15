class Airport

  attr_accessor :slots, :weather

  def initialize
    @slots = []
    @weather = "sunny"
  end

  def land(plane)
    fail "Weather conditions too dangerous for landing" if @weather == "stormy"
    @slots.push(plane)
  end

  def takeoff(slot_number)
    fail "Weather conditions too dangerous for take-off" if @weather == "stormy"
    @slots.delete_at(slot_number)
  end
  
end
