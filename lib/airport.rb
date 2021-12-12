class Airport
  attr_reader :capacity
  attr_reader :hangar

  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def receive(plane)
    fail "Sorry, Hangar Full" if full?
    @hangar << plane
  end

  def release
    weather_warning if weather_alert?
  end
  
  def empty?
    true
  end

  private

  def weather_alert?
    Weather.report == "Storms on the Horizon" ? true : false
  end

  def weather_warning
    fail "Sorry, No Flying, Storms Approaching"
  end

  def full?
    @hangar.count >= capacity
  end
end
