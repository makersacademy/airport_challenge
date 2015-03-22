class Plane
  DEFAULT_SEATS = 50
  attr_reader :flying, :capacity, :seats
  alias_method :airborne?, :flying

  def initialize(options = {})
    options = defaults.merge(options)
    @flying = options[:airborne]
    @capacity = options[:capacity]
    @seats = []
  end

  def take_off
    @flying = true
    self
  end

  def land
    @flying = false
    self
  end

  def board(passenger)
    fail "Plane Full" if full?
    check_in(passenger)
    seats << passenger
  end

  private

  attr_writer :seats

  def full?
    seats.length >= capacity
  end

  def defaults
    { airborne: true, capacity: DEFAULT_SEATS }
  end

  def check_in(passenger)
    passenger.check_in
  end
end
