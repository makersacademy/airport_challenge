class Airport

  DEFAULT_CAPACITY = 20

  def initialize(max_capacity = DEFAULT_CAPACITY)
    @max_capacity = max_capacity
    @plane_list = []
  end

  def land(plane)
    raise "That plane is already in the airport" if @plane_list.include?(plane)
    raise "The airport is full - no landing allowed" if capacity.zero?
    raise "No landing allowed - Stormy weather" if current_weather == "Stormy"

    @plane_list << plane
    return "Plane landed"
  end

  def take_off(plane)
    raise "No take-off allowed - Stormy weather" if current_weather == "Stormy"
    raise "There are no planes at the airport" if @plane_list.empty?
    raise "That plane isn't at the airport" if !@plane_list.include?(plane)

    @plane_list.delete(plane)
    return "Successful take off"
  end

  def include?(plane)
    @plane_list.include?(plane)
  end

  def capacity
    return @max_capacity - @plane_list.length
  end
end
