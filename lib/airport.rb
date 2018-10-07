class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :weather
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather = Weather.new
    @hanger = Array.new
    @capacity = capacity
  end

  def check_weather
    @weather.check
  end

  def land(plane)
    raise('Cannot land in stormy weather') if check_weather == 'stormy'
    raise('Cannot land. Airport is full.') if full?
    @hanger << plane
  end

  def take_off(plane)
    raise('Cannot take off in stormy weather') if check_weather == 'stormy'
    @hanger.delete(plane)
    #needs to not take off planes that are not in the hanger
  end

  def in_hanger?(plane)
    @hanger.include? plane
  end

  def full?
    @hanger.length >= @capacity
  end
end
