require_relative 'plane'
require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 20
  attr_reader :planes
  attr_accessor :capacity, :sunny

  def initialize capacity = DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
  end

  def take_off plane
    fail 'No planes at the airport' if empty?
    fail 'Weather stormy! Cannot take off!' unless sunny
    @planes.pop
  end
 

  def land plane
    fail 'Airport full!' if full?
    @planes << plane
  end

  private

  

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end

# p airport = Airport.new