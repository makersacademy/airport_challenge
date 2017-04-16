class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes
  attr_accessor :weather

  def initialize(x = 1, y = DEFAULT_CAPACITY)
    @planes = []
    # Weather is good when set to '1' and stormy when '0'
    @weather = x
    @capacity = y
  end

  def land_plane(plane)
    full?
    weather?
    @planes << plane
  end

  def plane_take_off
    weather?
    @planes.pop
  end

  def weather?
    raise ArgumentError, "Weather Stormy!", caller if @weather == 0
  end

  def full?
    raise ArgumentError, "Airport Full!", caller if @planes.count == @capacity
  end

  private :weather?, :full?

end
