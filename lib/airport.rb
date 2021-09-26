require 'plane'

class Airport
  def initialize
    default_capacity = 20
    @capacity = default_capacity
    @my_plane_a = Plane.new("Plane A","airport")
    @planes_parked = [@my_plane_a]
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

  def specific_plane_in_airport?(specific_plane)
    @planes_parked.each do |plane|
      if plane.check_id == specific_plane.check_id
        return true
      else
        return false
      end
    end
  end
end
