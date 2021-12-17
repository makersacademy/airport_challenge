class Airport
  MAX_DOCKS_DEFAULT = 50
  BFT_SCALE = 0..12
  MAX_BFT = 8
  attr_reader :capacity

  def initialize(capacity = MAX_DOCKS_DEFAULT)
    @planes = []
    @capacity = capacity
  end
  
  def call_to_land(plane)
    raise 'No free docks!' if self.full?()
    raise 'Too stormy to land!' if self.stormy?()
    
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

  def stormy?()
    return rand(BFT_SCALE) > MAX_BFT
  end

  def find?(plane)
    return @planes.include?(plane)
  end

  def full?
    return @planes.size >= @capacity
  end
  
end
