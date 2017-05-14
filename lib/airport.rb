require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize
    @planes = []
  end

  def take_off plane
    fail 'No planes at the airport' if empty?
    @planes.pop
  end
 

  def land plane
    fail 'Airport full!' if full?
    @planes << plane
  end

  



  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
