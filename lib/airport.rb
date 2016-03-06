require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    create_aprons # the place where planes park is called apron.
    @weather = Weather.new
  end

  def land plane
    can_land? plane
  end

  def take_off plane
    can_take_off? plane
  end

  def has_plane? plane
    check_aprons plane
  end

  private

  attr_reader :planes

  def create_aprons
    @planes = []
  end

  def check_aprons plane
    planes.include? plane
  end

  def can_land? plane
    raise 'Cannot land since airport is full' if full?
    raise 'Unable to land due to stormy weather' if weather.stormy?
    raise 'Plane already in the airport' if check_aprons plane
    landing_authorized plane
  end

  def landing_authorized plane
    planes << plane
    plane.land
    "#{plane} landed at #{self}"
  end

  def can_take_off? plane
    raise 'Plane not in the airport' unless check_aprons plane
    raise 'Unable to take off due to stormy weather' if weather.stormy?
    take_off_authorized plane
  end

  def take_off_authorized plane
    planes.delete(plane)
    plane.take_off
    "#{plane} has departed from #{self}"
  end

  def full?
    planes.size == capacity
  end
end
