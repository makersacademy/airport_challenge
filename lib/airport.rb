class Airport

  attr_accessor  :planes, :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize (planes = 50, capacity = DEFAULT_CAPACITY)
    @planes = planes
    @capacity = capacity
    # rand(9) == 0 ? @weather = "stormy" : @weather = "sunny"
  end

  def get_weather
    rand(9) == 0 ? :stormy : :sunny
  end

end
