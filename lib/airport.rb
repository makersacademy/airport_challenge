class Airport
  attr_reader :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize
    @hangar = []
    @capacity = DEFAULT_CAPACITY
    @weather = 'sunny'
  end

  def land(plane)
    fail 'Airport full' if full?
    fail 'Cannot land in storm' if @weather == 'stormy'
    @hangar << plane
  end

  def weather(weather)
    @weather = weather.condition
  end

  private

  def full?
    hangar.count >= DEFAULT_CAPACITY
  end
end
