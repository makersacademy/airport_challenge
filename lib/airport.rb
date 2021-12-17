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
    'Done!'
  end

  private

  def full?
    return @planes.size >= @capacity
  end
  
end
