class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :hangar
  attr_reader :capacity, :storm

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @storm = false
  end

  def full?
    @hangar.length >= @capacity
  end

  def weather_check
    rand(7)
  end

  def stormy?
    if self.weather_check == 6
      @storm = true
    else
      storm = false
    end
  end
end