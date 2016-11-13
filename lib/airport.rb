require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  include Weather
  attr_reader :landed_planes, :airborne_planes, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @airborne_planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land plane, airport at full capacity" if full?
    raise "Cannot land under stormy weather conditions!" if stormy?
    @landed_planes << plane
  end

  def take_off
    raise "Cannot take off as there are no planes available" if empty?
    raise "Cannot take off under stormy weather conditions!" if stormy?
    @airborne_planes << @landed_planes.shift
  end

  def empty?
    @landed_planes.empty?
  end

  def full?
    @landed_planes.count == DEFAULT_CAPACITY
  end
end
