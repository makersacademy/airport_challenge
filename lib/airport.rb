class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    weather
    fail "Airport is full" if @planes.size >= @capacity
    fail "Bad weather" if weather == "Stormy"
    fail "This plane is already in the airport" if @planes.include?(plane)

    @planes << plane
  end

  def take_off(plane)
    weather
    fail "Bad weather" if weather == "Stormy"
    fail "This plane is not in the airport" unless @planes.include?(plane)

    @planes.delete(plane)
  end

  def weather
    ["Sunny", "Sunny", "Sunny", "Stormy"].sample
  end
end
