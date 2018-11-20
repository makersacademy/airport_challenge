class Airport
  attr_reader :hangar
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  attr_reader :weather

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @hangar = []
    @capacity = capacity
  end

  def storm
    @weather = 'storm'
  end

  def good
    @weather = 'good'
  end
end
