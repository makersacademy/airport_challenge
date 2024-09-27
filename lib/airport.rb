require 'plane'

class Airport
  def initialize
    default_capacity = 20
    @capacity = default_capacity
    @planes_parked = []
  end

  def check_capacity
    return @capacity
  end

  def change_capacity(new_capacity)
    @capacity = new_capacity
    return @capacity
  end

  def how_many_planes_in_airport
    @number_of_planes = @planes_parked.length
    return @number_of_planes
  end

  def airport_full?
    @number_of_planes = @planes_parked.length
    return true if @number_of_planes >= @capacity
    return false if @number_of_planes < @capacity
  end

  def park_plane(plane)
    @planes_parked.push(plane)
    return @planes_parked
  end

  def which_planes_in_airport
    # return the contents of an array
    return @planes_parked
  end

  def specific_plane_in_airport?(specific_plane)
    if @planes_parked == []
      return false
    end
    @planes_parked.each do |plane|
      return true if plane.check_id == specific_plane.check_id
      return false if plane.check_id != specific_plane.check_id
    end
  end

end
