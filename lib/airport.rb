require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def landing_clear?
    raise 'Negative. Cancel landing because of the weather.' if stormy?
    raise 'Negative. Airport is full.' if full?
    true
  end

  def takeoff_clear?
    raise 'Negative. Cancel take-off because of the weather.' if stormy?
    true
  end

  def checkin(plane)
    add(plane)
  end

  def checkout(plane)
    remove(plane)
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def add(plane)
    raise 'Error. This plane is already checked in.' if checkedin?(plane)
    @planes << plane
  end

  def remove(plane)
    raise 'Error. This plane has not been checked in.' unless checkedin?(plane)
    @planes.delete(plane)
  end

  def checkedin?(plane)
    planes.include? plane
  end
end
