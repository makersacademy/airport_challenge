
class Airport

  @@flying_planes = []
  @@landed_planes = []

  attr_accessor :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_fleet = []
    @capacity = capacity
  end

  def random_weather
    weather = { "stormy" => 20, "sunny" => 80 }
    choose_weighted(weather)
  end

  def land_plane(plane)
    if random_weather == "sunny"
    fail "error - that plane has already landed" if @@landed_planes.include? plane
    @airport_fleet << plane && @@landed_planes << plane
    @@flying_planes.pop
      "Plane has landed"
    else
      "Plane cannot land as it is stormy"
    end
  end

  def land_plane_full(plane)
    if airport_full?
      "plane cannot land as the airport is full"
    else
      @@landed_planes << plane
    end

  end

  def airport_full?
    @@landed_planes.count >= @capacity
  end

  def take_off(plane)
    if random_weather == "sunny"
      fail "error - that plane is already in the air" if @@flying_planes.include? plane
      @@flying_planes << plane
      @@landed_planes.pop && @airport_fleet.pop
      "the plane has taken off"
    else
      "plane cannot take off, it's stormy"
    end
  end

  def choose_weighted(weighted)
    sum = weighted.inject(0) do |sum, item_and_weight|
    sum += item_and_weight[1]
  end
    target = rand(sum)
    weighted.each do |item, weight|
    return item if target <= weight
    target -= weight
    end
  end

  #def flying?(plane)
  #  @flying_planes.include?
  #end

#  def landed?(plane)
  #  @landed_planes.include?
#  end

end
