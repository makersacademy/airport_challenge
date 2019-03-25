class Airport
  attr_reader :capacity
  attr_reader :hanger
  ::DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = ["stormy", "sunny"].sample
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Can't land due to stormy weather" if storm

    @hanger << plane
  end

  def take_off
    fail "Can't take off due to stormy weather" if storm

    @hanger.pop
  end

  def taken_off?
    @hanger.length
  end

  def storm
    true if @weather == "stormy"
  end

  def full?
    true if @hanger.count >= DEFAULT_CAPACITY
  end
end
