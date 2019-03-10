class Airport

  attr_reader :plane_list
  attr_reader :weather

  def initialize(weather = Weather.new)
    @plane_list = []
    @weather = weather
  end

  def land(plane)
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
  
end
