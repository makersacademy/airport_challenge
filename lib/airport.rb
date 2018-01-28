class Airport

  attr_reader :plane, :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    if stormy_weather?
      raise "It is too stormy to land"
    end
    if full?
      raise "Airport is full"
    end
    @planes.push(plane)
  end

  def take_off
    if stormy_weather?
      raise "It is too stormy to take off"
    end
    @planes.pop
  end

  private
  def stormy_weather?
    rand(2) == 1
  end

  def full?
    planes.length >= capacity
  end

end
