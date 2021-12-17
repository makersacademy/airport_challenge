class Airport
  MAX_DOCKS_DEFAULT = 50
  attr_reader :capacity

  def initialize(capacity = MAX_DOCKS_DEFAULT)
    @planes = []
    @capacity = capacity
  end
  
  def call_to_land(plane)
    raise 'No free docks!' if self.full?
    
    plane.land()
    @planes.push(plane)
    return "#{plane} landed!"
  end

  def call_to_take_off(plane)
    raise "#{plane} is not at this airport!" unless self.find?(plane)

    plane.take_off()
    return "#{@planes.delete(plane)} has taken off!"
  end

  private

  def find?(plane)
    return @planes.include?(plane)
  end

  def full?
    return @planes.size >= @capacity
  end
  
end
