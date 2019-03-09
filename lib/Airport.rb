class Airport

  attr_reader :airport_planes
  attr_reader :max_capacity

  def initialize(max_capacity = 20)
    @max_capacity = max_capacity
    @airport_planes = []
  end

  def land(plane)
    raise "That plane is already in the airport" if @airport_planes.include?(plane)
    raise "The airport is full - no landing allowed" if capacity == 0
    raise "The weather is stormy - no landing allowed" if check_weather == "Stormy"

    @airport_planes << plane
    return "Plane landed"
  end

  def take_off(plane)
    raise "The weather is stormy - no take off allowed" if check_weather == "Stormy"

    if @airport_planes.include?(plane)
      @airport_planes.delete(plane)
      return "Successful take off"
    end

    raise "That plane isn't at the airport"
  end

  def check_weather
    random = Random.rand(1..50)
    return "Sunny" if random != 25
    return "Stormy"
  end

  def capacity
    return @max_capacity - @airport_planes.length
  end
end
