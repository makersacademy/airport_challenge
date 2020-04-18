class Airport
  attr_accessor :planes, :capacity
  attr_reader :weather
  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def full?
    @planes.count == @capacity ? airport_full_message : false
  end

  private
  def airport_full_message
    fail "Airport is full"
  end
end
