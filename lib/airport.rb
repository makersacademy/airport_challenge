class Airport

attr_reader :plane_array

  def initialize
    @plane_array = []
  end

  def land(plane)
    raise "You can't land a plane in a storm!" if weather == "stormy"
    @plane_array << plane
  end

  def take_off(plane)
    raise "You can't land a plane in a storm!" if weather == "stormy"
    @plane_array.delete(plane)
  end

  def weather
    (rand(1..10)) == 1 ? "stormy" : "fine"
  end

end
