require "plane"

class Airport

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def weather(conditions = rand(2))
    case conditions
    when 0
      @weather = "clear"
    when 1
      @weather = "stormy"
    end
  end

  def land(plane)
    fail "The weather is too rough." if @weather == "stormy"
    fail "The hanger is full." if @hanger.length >= @capacity 
    @hanger.push(plane)
    @hanger
  end

  def takeoff(plane)
    fail "The weather is too rough." if @weather == "stormy"
    @hanger.delete(plane)
  end

end
