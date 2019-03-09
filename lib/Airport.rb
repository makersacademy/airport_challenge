class Airport

  attr_reader :plane_list
  attr_reader :max_capacity

  def initialize(max_capacity = 20)
    @max_capacity = max_capacity
    @plane_list = []
  end

  def land(plane)
    raise "That plane is already in the airport" if @plane_list.include?(plane)
    raise "The airport is full - no landing allowed" if capacity == 0
    raise "The weather is stormy - no landing allowed" if check_weather == "Stormy"

    @plane_list << plane
    return "Plane landed"
  end

  def take_off(plane)
    raise "The weather is stormy - no take off allowed" if check_weather == "Stormy"

    if @plane_list.include?(plane)
      @plane_list.delete(plane)
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
    return @max_capacity - @plane_list.length
  end
end
