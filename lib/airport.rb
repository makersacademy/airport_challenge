require_relative './plane.rb'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(user_required_capacity = DEFAULT_CAPACITY)
    @capacity = user_required_capacity
    @planes = []
    @bad_weather_probability = 1
  end

  def land(plane)
    fail "This plane is already in the airport" if @planes.include?(plane)
    fail "The airport is full" if full?
    fail "It is too stormy to land" if stormy?
    @planes << plane
  end

  def take_off(plane)
    fail "This plane is not in the airport" unless @planes.include?(plane)
    fail "It is too stormy to take off" if stormy?
    @planes.slice!(@planes.index(plane))
  end

  def location(plane)
    return "This plane is grounded in the airport" if @planes.include?(plane)
    return "This plane is airborne"
  end

  def change_capacity(new_capacity)
    @capacity = new_capacity
  end

  def stormy?
    true if rand(@bad_weather_probability..10) == 10
    false
  end

  def full?
    @planes.count >= @capacity
  end

  def bad_weather_percentage(percentage = 10)
    @bad_weather_probability = (percentage / 10)
  end

end
