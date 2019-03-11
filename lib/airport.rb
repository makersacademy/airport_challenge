class Airport

  attr_reader :plane_list
  attr_reader :weather

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @plane_list = []
    @weather = weather
  end

  def land(plane)
    p @capacity
    p @weather
    raise "It is stormy. For safety reasons, the plane cannot land!" if stormy?
    raise "Airport capacity is reached! Plane cannot land." if capacity_reached?
    @plane_list << plane
  end

  def take_off(plane)
    raise "It is stormy. For safety reasons, the plane cannot take off!" if stormy?
    raise "There are no planes to take off!" if empty?
    @plane_list.pop
  end

  def empty?
    @plane_list.empty?
  end

  def stormy?
    @weather.stormy?
  end

  def capacity_reached?
    @plane_list.length == @capacity
  end

  def change_capacity(num)
    @capacity = num
  end
  
end
