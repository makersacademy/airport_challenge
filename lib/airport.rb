# class Destination
# end

require './lib/plane'

class Airport

  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = ["Sunny", "Stormy"]
    @specified_capacity = capacity
  end

  attr_reader :planes, :weather, :specified_capacity

  def land?(plane)
    fail "Cannot land due to weather" if stormy?
    @planes
    fail "Plane is already grounded" if @flying
    self.grounded?
    @planes << plane
  end

  def take_off?(plane)
    fail "Cannot fly due to weather" if stormy?
    plane -= @planes
  end

  # private

  def stormy?
    @weather == "Stormy"
  end

  def grounded?
    @flying ? false : true
  end

  def full?
    @planes.count >= 1 ? true : false
  end

end
