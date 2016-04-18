require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50
  
  attr_reader :planes, :weather
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = weather
  end

  def stormy? 
    @stormy
  end

  def launch(plane)
    fail 'Grounded: stormy weather.' if stormy?
    fail 'No planes for take off.' if empty? 
    @planes.pop
  end

  def land(plane)
    fail 'Airport is full.' if full?
    fail 'Cannot land: stormy weather.' if stormy?
    @planes << plane
  end

  private

  def full?
    @planes.count == DEFAULT_CAPACITY
  end

  def empty? 
    @planes.empty? 
  end

end