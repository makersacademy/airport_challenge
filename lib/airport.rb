require 'weather'

class Airport
  include Weather

  attr_reader :capacity
  attr_reader :hangar

  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def receive(plane)
    fail "Sorry, Hangar Full" if full?
    weather_warning if weather_alert?
    @hangar << plane
  end

  def release(plane)
    weather_warning if weather_alert?
  end
  
  private

  def weather_alert?
    Weather.report == "Storms on the Horizon" ? true : false
  end

  def weather_warning
    fail "Sorry, Runways Closed, Storms Approaching"
  end

  def full?
    @hangar.count >= capacity
  end
end
