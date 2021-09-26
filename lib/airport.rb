require 'plane'

class Airport
  def initialize(default_capacity)
    @capacity = default_capacity
    @planes_parked = ["Plane 1"]
    @number_of_planes = @planes_parked.length
  end

  def check_capacity
    return @capacity
  end

  def change_capacity(new_capacity)
    @capacity = new_capacity
    return true
  end

  def how_many_planes_in_airport
    @number_of_planes = @planes_parked.length
    return @number_of_planes
  end

  def airport_full?
    @number_of_planes = @planes_parked.length
    if @number_of_planes >= @capacity
      return true
    else
      return false
    end
  end

  def park_plane(plane)
    @planes_parked.push(plane)
    return true
  end

  def which_planes_in_airport
    # return the contents of an array
    return @planes_parked
  end

  def specific_plane_in_airport?(plane)
    if @planes_parked.include?(plane)
      # if plane is a member of the array called @planes_parked
      return true
    else
      return false
    end
  end
  
end
