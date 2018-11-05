class Airport
  attr_reader :hangar
  attr_accessor :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    if rand(1..10) == 1
      @weather = 'storm'
    else
      @weather = 'good'
    end
  end

  def storm
    @weather = 'storm'
  end

  def good
    @weather = 'good'
  end
end
