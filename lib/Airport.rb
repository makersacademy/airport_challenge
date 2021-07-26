require_relative 'plane'

class Airport
  attr_reader :array_of_planes, :airport
  attr_writer :capacity
  
  def initialize
    # class instance so that planes in the air and landed can be tracked.
    @@array_of_planes = []
    # @planecount = 0
    # instance variable for capacity as it will be airport specific
    p @capacity = 20
  end
  
  # potential code to add if required to update plane array
  # def update_plane_array(plane, status, airport)
  #   @@array_of_planes.push([[plane, status, airport]])
  # end
  
  # potential code to add if require display of the plane list
  # def view_planes
  # @@array_of_planes

  #end
  
  def override_capacity(capacity)

    @capacity = capacity

  end
  
  def newplane

    @airport = object_id 
    newplane = Plane.new
    @@array_of_planes.push([newplane.object_id, newplane.status, object_id])
    @@array_of_planes.count

  end
  
  def checkhascapacity

    # checks filtered planes array for the airport, is landed and is less than capacity       
    # @@array_of_planes.select { |item| item.last == object_id && item.include?("landed")}.count
    # @@array_of_planes.select { |item| item.last == object_id }.
    #                   select { |item| item.include?("landed") }.count
    @@array_of_planes.select { |item| item.last == object_id && item.include?("landed") }.count < @capacity
    
    # returns capacity is available = true
          
  end

# default plane condition can be followed up in an exception report.

  def instructlanding_at_airport(weather, plane = "999", airport) 
    index_plane_array = @@array_of_planes.find_index { |a| a[0] == plane } 
    fail "the plane is already landed" if @@array_of_planes[index_plane_array].
                                                    include?("landed") == true

    return false unless weatherok(weather) == true && checkhascapacity == true

    # atc selects plane to land assigns airport to land at.
    # based on plane no. and airport from ATC and set status to landed
    index_plane_array = @@array_of_planes.find_index { |a| a[0] == plane }
    @@array_of_planes[index_plane_array] = [plane, "landed", airport]
    # returns no longer in airport = true 
    return true
       
  end
  
  def instruct_takeoff_from_airport(weather, plane, airport)
    index_plane_array = @@array_of_planes.find_index { |a| a[0] == plane } 
    
    fail "the plane is flying, cannot take off" if @@array_of_planes[index_plane_array].
                                                              include?("flying") == true 
    
    return false unless weatherok(weather) == true 

    # atc selects plane to land assigns airport to land at.
    # based on plane no. and airport from ATC and set status to flying and set airport to SKY
    @@array_of_planes[index_plane_array] = [plane, "flying", airport]
    # returns no longer in airport = true
    return true
           
  end
 
  def weatherok(weather = rand(10))
    weather != 10
    
  end
end
