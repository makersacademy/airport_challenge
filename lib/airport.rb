class Airport

  attr_reader :plane_list

  def initialize(weather = Weather.new)
    @plane_list = []
    @weather = weather
  end

  def land(plane)
    @plane_list << plane
  end

  def take_off(plane)
    @plane_list.pop unless empty?
  end

  def empty?
    @plane_list.empty?
  end
  
end
