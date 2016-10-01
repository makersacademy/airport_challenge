
class Airport
  attr_accessor :capacity, :airport_name
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY, airport_name = "airport(unnamed)")
    @planes = []
    @capacity = capacity
    @airport_name = airport_name
  end

  def random_weather
    weather = { "stormy" => 20, "sunny" => 80 }
    choose_weighted(weather)
  end

  def land_plane(plane)
    if random_weather == "sunny"
      @planes << plane
      #@planes.last
      "Plane has landed"
    else
      "Plane cannot land as it is stormy"
    end
  end

  def land_plane_full(plane)
    if airport_full?
      "plane cannot land as the airport is full"
    else
      @planes << plane
    end

  end

  def airport_full?
    @planes.count >= @capacity
  end

  def take_off(plane)
    if random_weather == "sunny"
      @planes.delete(plane)
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
end
