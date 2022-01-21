class Plane

  def instruct_to_land
    return "Plane has landed!"
  end
  
  def instruct_to_takeoff
    return "Plane has taken off!"
  end

  def airport_capacity_check(status)
      airport_capacity = 21
      current_capacity = 20
    if airport_capacity >= current_capacity
      return "Plane has to wait for space"
    else 
      return "Plane has landed!"
    end
  end

  def airport_capacity
    

  end

  def current_capacity

  end
end

# plane = Plane.new
# result = plane.airport_capacity_check
# p result
