class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    raise "Plane already landed" if @planes.include?(plane)

    raise "Airport full" if full?

    @planes << plane
  end

  def take_off
    raise "No planes" if empty?
    
    @planes.pop
  end

  def in?(plane)
    @planes.include?(plane)
  end

  private

  def empty?
    @planes.empty?
  end

  def full?
    @planes.length >= @capacity
  end
end
