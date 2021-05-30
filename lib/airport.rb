require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail 'Unable to land. Weather is stormy' if stormy?
    fail 'Airport is full' if airport_full?
    planes << plane
  end

  def take_off
    fail 'Weather is stormy. Cannot take off' if stormy?
    fail 'No planes available to take off' if airport_empty?
    planes.pop     
  end


  private 
  attr_reader :weather

  def airport_full?
    planes == @capacity
  end

  def airport_empty?
    planes.empty?
  end

  def stormy?
    rand(1...6) == 1
  end
end