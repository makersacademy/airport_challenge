require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50
  DEFAULT_PLANES = 5

  include Weather

  attr_reader :planes
  attr_accessor :capacity

  def initialize(default = DEFAULT_CAPACITY, start_planes = DEFAULT_PLANES)
    @planes = []
    start_planes.times {@planes << Plane.new}
    @capacity = default
    @stormy = generate_weather
  end

  def land(plane)
    fail "This plane has already landed" if plane.landed?
    fail "It is too stormy to land" if stormy?
    fail "The airport is full" if full?
    @planes << plane
    plane.landed
    plane
  end

  def take_off
    fail "It is too stormy to fly" if stormy?
    fail "There are no planes" if @planes.empty?
    @planes[-1].flying
    @planes.pop
  end

  def new_day
    @stormy = generate_weather
  end

  private

  def full?
    @planes.count >= @capacity ? true : false
  end
end
