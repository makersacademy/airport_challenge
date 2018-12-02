class Airport
  attr_reader :planes, :weather
  DEFAULT_CAPACITY = 150

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new.stormy?
    @capacity = capacity
  end

  def land(plane)
    fail "It is too stormy to land" if stormy?
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off
    fail "It is too stormy for take off" if stormy?
    fail "There are no planes" if empty?
    @planes.pop
  end


  private
  def stormy?
    weather == true
  end

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.length == 0
  end

end
