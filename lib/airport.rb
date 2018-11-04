class Airport

  attr_accessor :weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = current_weather
    @capacity = capacity
  end

  def current_weather
    set = rand(10)
    set > 0 ? @weather = 'fine' : @weather = 'stormy'
  end

end
