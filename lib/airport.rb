require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes
  attr_reader :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def instruct_landing(plane)
    raise "There is no space in the airport" if full?
    raise "The weather is too stormy to land" if @weather.stormy?
    plane.land
    @planes << plane
  end

  def instruct_take_off(plane)
    raise "There are no planes in the airport" if empty?
    raise "The weather is too stormy to take off" if @weather.stormy?
    plane.taken_off
    @planes.delete(plane)
  end

  def full?
    @planes.count == DEFAULT_CAPACITY
  end

  def empty?
    @planes.count == 0
  end

  # def stormy?
  #   @weather == :stormy
  # end

end
