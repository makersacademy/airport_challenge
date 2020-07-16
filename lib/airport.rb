class Airport
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, stormy)
    raise "No Space" if @planes if full?
    raise "Cannot land when stormy" if stormy == true

    @planes << plane

  end

  def take_off(plane, stormy)
    raise 'No planes available' if @planes if empty?
    raise "Cannot take off when stormy" if stormy == true
    plane.flying = true
    puts "We have lift-off"
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end
#
  def empty?
    @planes.empty?
  end

end
