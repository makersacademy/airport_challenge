require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    do_land_check(plane)
    planes << plane
    'The plane has landed!'
  end

  def do_land_check(plane)
    fail 'This plane has already landed!' if plane.landed?
    fail 'The airport is full!' if full?
    fail 'Land Denied: Storm!' if weather.stormy?
  end

  def take_off_plane(plane)
    do_take_off_check(plane)
    planes.pop
    'The plane has taken off!'
  end

  def do_take_off_check(plane)
    fail 'This plane has already taken off!' unless plane.landed?
    fail 'The airport is empty!' if empty?
    fail 'Take off Denied: Storm!' if weather.stormy?
  end

  def full?
    planes.size >= DEFAULT_CAPACITY
  end

  def empty?
    planes.size <= 0
  end
  private :full?, :empty?, :do_land_check, :do_take_off_check
end
