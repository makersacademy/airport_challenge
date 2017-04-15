class Airport

  attr_accessor :slots, :weather

  def initialize
    @slots = []
    @weather = "stormy"
  end

  def land(plane)
    if @weather == "stormy"
      fail "Weather conditions too dangerous for landing"
    else
      @slots.push(plane)
    end
  end

  def takeoff(slot_number)
    fail "Weather conditions too dangerous for take-off" if @weather == "stormy"
    @slots.delete_at(slot_number)
  end
end
