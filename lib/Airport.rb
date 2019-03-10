class Airport

  attr_reader :plane_list
  attr_reader :max_capacity

  def initialize(max_capacity = 20)
    @max_capacity = max_capacity
    @plane_list = []
  end

  def land(plane)
    raise "That plane is already in the airport" if @plane_list.include?(plane)
    raise "The airport is full - no landing allowed" if capacity.zero?
    raise "No landing allowed due to the weather" if current_weather == "Stormy"

    @plane_list << plane
    return "Plane landed"
  end

  def take_off(plane)
    raise "No take-off allowed due to the weather" if current_weather == "Stormy"

    if @plane_list.include?(plane)
      @plane_list.delete(plane)
      return "Successful take off"
    end

    raise "That plane isn't at the airport"
  end

  def capacity
    return @max_capacity - @plane_list.length
  end
end
