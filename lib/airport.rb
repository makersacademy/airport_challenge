class Airport

  attr_reader :capacity, :capacity_max

  DEFAULT_CAPACITY = 20
  def initialize(capacity_max = DEFAULT_CAPACITY)
    @capacity_current = 0
    @capacity_max = capacity_max
    @planes = []
    @bad_weather = set_weather?
  end

  def max_capacity?
    @capacity_current == @capacity_max ? true : false
  end

  def land(plane)
    raise "Too many planes! Land somewhere else!" if max_capacity? == true
    raise "This plane is already on the ground!" if plane.location != "In Air"
    raise "Too stormy! Land somewhere else!" if @bad_weather == true
    @capacity_current += 1
    @planes << plane
  end

  def takeoff
    raise "Too stormy! Wait for better weather!" if @bad_weather == true
    @planes.pop
  end

  def set_weather?
    @bad_weather = [false, true, false, false, false].sample
  end
end
