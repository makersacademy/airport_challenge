require_relative 'plane'
require_relative 'weather'

class Airport
  include Forecast

  attr_accessor(:capacity, :hangar)

  def initialize (capacity=10)
    @capacity = capacity
    @hangar = []
  end

  def land plane
    fail 'stormy weather, permission denied' if forecast == "stormy"
    fail 'airport full, permission denied' if full?
    hangar << plane
    plane.landed
  end

  def take_off plane
    fail 'stormy weather, permission denied' if forecast == "stormy"
    hangar.pop
    plane.flying
  end

  def forecast
    Forecast.now
  end

  # private

  attr_reader :hangar

  def full?
    hangar.count >= capacity
  end

end