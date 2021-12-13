require_relative 'weather'

class Airport
  include Weather

  attr_reader :capacity
  attr_reader :hangar

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def receive(plane)
    fail "Sorry, Hangar Full" if full?
    weather_warning if Weather.alert?
    hangar << plane
  end

  def release(plane)
    weather_warning if Weather.alert?
    hangar.delete_at(hangar.index(plane))
  end
  
  private

  def weather_warning
    fail "Sorry, Runways Closed, Storms Approaching"
  end

  def full?
    hangar.count >= capacity
  end
end
