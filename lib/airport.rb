class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = %w(Stormy Sunny Sunny Sunny).sample
  end

  def weather
  end

  def land(plane)
    fail 'Airport is full!' if full?
    fail 'That plane is already landed here!' if @planes.include? plane
    plane.status = "Landed"
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if empty?
    fail "Sorry, it is too stormy to take off" if @weather == "Stormy"
    @planes.pop.status = "Taken off"
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
