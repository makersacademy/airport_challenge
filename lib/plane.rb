class Plane
  attr_reader :airport_capacity
  attr_reader :current_capacity

  def initialize
    @current_capacity = 20
    @airport_capacity = 21
  end

  def instruct_to_land
    return "Plane has landed!"
  end
  
  def instruct_to_takeoff
    return "Plane has taken off!"
  end

  def capacity_check
    if airport_capacity >= current_capacity
      return "Plane has to wait for space"
    else 
      return "Plane has landed!"
    end
  end

  def weather_check
    rand(2)
  end

  def weather
    if weather_check = 0
      "Storms on the way, permission to land declined"
    else
      "Its a sunny day on the runway"
    end
  end
end



