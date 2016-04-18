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
    fail 'Already in flight.' if plane.flying? == true
    fail 'Grounded.' if stormy?
    fail 'No planes.' if empty? 
    @planes.pop
  end

  def land(plane)
    fail 'Already landed.' if plane.flying? == false
    fail 'Cannot land.' if stormy?
    fail 'Airport full.' if full?
    plane.landed? == true
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