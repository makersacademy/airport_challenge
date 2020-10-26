class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

end
