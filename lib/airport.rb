class Airport
  attr_reader :planes, :weather, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = ['Cloudy', 'Sunny', 'Stormy', 'Rainy', 'Snowy'].sample
  end

  def safe?
    @weather != 'Stormy'
  end

  def full?
    @planes.count >= @capacity
  end
end
