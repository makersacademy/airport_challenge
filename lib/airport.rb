require_relative 'plane'

class Airport
    DEFAULT_CAPACITY = 11
    attr_reader :plane, :capacity

    def capacity
      @capacity
    end

    # attr_reader :capacity, :planes
  
    def initialize(capacity = DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end

  def land(plane)
    raise "Denied permission to land due to storm" if stormy? 
    raise "Full to capacity: Landing Denied" if full?
    @planes << plane
  end
        
  def take_off(airport)
    raise "Denied permission to take off due to storm" if stormy? 
  end

  def in_air?(plane)
    @plane == plane
  end     

    private

  def full?
    @planes.length >= @capacity

  end

  def stormy?
    rand(1..10) > 7
  end

end
