require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land_plane(plane)
    fail 'The airport is full!' if full?
    fail 'Land Denied: Storm!' if @weather.stormy?
    @planes << plane
    'The plane has landed!'
  end

  def take_off_plane(plane)
    fail 'This plane has already taken off!' unless plane.landed?
    fail 'The airport is empty!' if empty?
    fail 'Take off Denied: Storm!' if @weather.stormy?
    @planes.pop
    'The plane has taken off!'
  end

  def full?
    @planes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.size <= 0
  end
  private :full?, :empty?
end
