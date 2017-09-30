class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full!' if full?
    fail 'That plane is already landed here!' if @planes.include? plane
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if empty?
    @planes.pop
  end

  private
  attr_reader :plane

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

end
