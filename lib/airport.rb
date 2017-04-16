require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50

  include Weather

  attr_reader :planes
  attr_accessor :capacity

  def initialize(default = DEFAULT_CAPACITY)
    @planes = []
    @capacity = default
    @stormy = generate_weather
  end

  def land(plane)
    fail "The airport is full" if full?
    fail "This plane has already landed" if plane.landed?
    @planes << plane
    plane.landed
    plane
  end

  def take_off
    fail "There are no planes" if @planes.empty?
    @planes[0].flying
    @planes.shift
  end

  private

  def full?
    @planes.count >= @capacity ? true : false
  end
end
