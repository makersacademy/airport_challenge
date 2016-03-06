require_relative 'weather'

class Airport

  attr_reader :airfield, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @airfield  = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Plane cannot land" unless can_land?
    plane.land
    @airfield << plane
  end

  def confirm_landing(plane)
    airfield.include?(plane)
  end

  def dispatch(plane)
    fail "Cannot take off" unless can_take_off?(plane)
    @airfield.delete_if { |pl| pl == plane }
    plane.take_off
    plane
  end

  def confirm_dispatch(plane)
    !airfield.include?(plane)
  end

  def stormy?
    @weather.stormy?
  end

  private

  def at_capacity?
    capacity == airfield.size
  end

  def can_land?
    fail "The airport is full" if at_capacity?
    fail "The weather is too bad" if stormy?
    true
  end

  def can_take_off?(plane)
    fail "This plane is not in the airfield" unless @airfield.include?(plane)
    fail "The weather is too bad" if stormy?
    true
  end

end
