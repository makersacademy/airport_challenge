class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize options = {}
    @planes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def land plane
    fail 'Sorry, Airport Full' if full?
    planes << plane
  end

  def take_off
    fail 'Airport is Empty' if empty?
    planes.pop
  end

  def plane_count
    planes.length
  end

  private

  attr_accessor :planes

  def empty?
    planes.empty?
  end

  def full?
    planes.length >= capacity
  end
end
