class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :hangar
  attr_reader :capacity, :storm

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def full?
    @hangar.length >= @capacity
  end

  def weather_setter
    rand(7)
  end

  def stormy?
    weather_setter == 6
  end
end
