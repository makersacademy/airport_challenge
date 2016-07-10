class Airport

  attr_reader :planes
  attr_accessor :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = self.weather_generator
  end

  def full?
    @planes.count >= capacity
  end

  def weather_generator
    generator = 1 + rand(5)
    if generator == 5
      @weather = 'stormy'
    else
      @weather = 'sunny'
    end
  end

end
