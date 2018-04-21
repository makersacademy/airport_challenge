class Airport

  attr_accessor :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_lands(plane, weather)
    # raise "Can't land: Bad weather conditions!" if weather.condition < 10
    # raise "Can't land: Airport is full!" unless planes.count < 2
    can_land = (weather.condition > 10) && (planes.count < 2)
    plane.land if can_land
    @planes << plane if can_land
  end

  def plane_take_off(plane, weather)
    # raise "Can't take off: Bad weather conditions!" if weather.condition < 10
    can_take_off = weather.condition > 10
    plane.take_off if can_take_off
    @planes.delete(plane) if can_take_off
  end
end
