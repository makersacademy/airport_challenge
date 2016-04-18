require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @capacity = capacity
    create_aprons # The place where the planes park is called apron.
    @weather = weather
  end

  def land plane
    can_land? plane
  end

  def take_off plane
    can_take_off? plane
  end

  def has_plane? plane
    check_planes plane
  end

  private

  attr_reader :planes

  def create_aprons
    @planes = []
  end

  def check_planes plane
    planes.include? plane
  end

  def can_land? plane
    fail 'Cannot land since airport is full' if full?
    fail 'Unable to land due to stormy weather' if weather.stormy?
    landing_authorized plane
  end

  def landing_authorized plane
    plane.land self
    planes << plane
    "#{plane} landed at #{self}"
  end

  def can_take_off? plane
    fail 'Unable to take off due to stormy weather' if weather.stormy?
    take_off_authorized plane
  end

  def take_off_authorized plane
    plane.take_off self
    planes.delete(plane)
    "#{plane} has departed from #{self}"
  end

  def full?
    planes.size == capacity
  end
end
