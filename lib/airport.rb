
require_relative "airplane"


class Weather
  def stormy?
    random_outlook == :stormy
  end

  private
  OUTLOOKS = [:stormy, :fine, :fine, :fine]

  def random_outlook
    OUTLOOKS.sample
  end

end


class Airport

  attr_reader :airport_capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def plane_landing(choice)
    fail "not allowed to land" if weather.stormy?
    fail "airport is full" if airport_full?
    @airport << choice
  end

  def take_off
    airport.pop()
  end

  def airport_full?
    @airport.count >= capacity
  end

  attr_reader :weather

end
