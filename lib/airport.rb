class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @plane = plane
    fail 'Airport is full!' if full?
    fail 'That plane is already landed here!' if already_landed?
    @plane.status = "Landed"
    @planes << @plane
    @plane
  end

  def take_off
    fail 'There are no planes!' if empty?
    # fail "Sorry, it is too stormy to take off" if weather == "Stormy"
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

  def already_landed?
    @planes.include? @plane
  end
end
