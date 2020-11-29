class Airport
  attr_reader :weather
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = ["sunny", "sunny", "stormy"].sample
  end

  def stormy?
    if @weather = "stormy"
      true
    else
      false
    end
  end

  def take_off(plane)
    if stormy?
      raise "Cannot take off in the storm!"
    else
      @hanger.delete(plane)
      return "Planes left in hangar: #{@hanger}"
    end
  end

  def land(plane)
    @plane = plane
    if full?
      raise "Hanger is full"
    elsif stormy?
      raise "Cannot land in the storm!"
    else
      @hanger << plane
    end
  end

  def full?
    if @hanger.length >= @capacity
      true
    else
      false
    end
  end
end
