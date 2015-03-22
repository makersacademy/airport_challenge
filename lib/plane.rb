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
    seats << passenger
    check_in(passenger)
  end

  private

  attr_writer :seats

  def defaults
    { airborne: true, capacity: DEFAULT_SEATS }
  end

  def check_in(passenger)
    passenger.check_in
  end
end
