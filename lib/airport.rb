class Airport
  attr_reader :planes, :weather, :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = ['Stormy', 'Sunny', 'Cloudy', 'Rainy', 'Snowy'].sample
  end

  def safe?
    @weather != 'Stormy'
  end

  def full?
    @planes.count >= @capacity
  end

  def weather(set)
    @weather = set
  end

end
