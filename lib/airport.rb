class Airport
  attr_accessor :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full

    planes << plane
  end

  def take_off(plane)
    # fail 'No planes available' if @planes.empty?
    #
    planes.delete(plane)
    "#{plane} has taken off"
  end

  private

  def full
    planes.count >= capacity
  end

end
