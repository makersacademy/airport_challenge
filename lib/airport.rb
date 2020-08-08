class Airport
  attr_accessor :hangar, :capacity

  def initialize(capacity = 10)
    @hangar = []
    @capacity = capacity 
  end

  def land(plane)
    landing_safety_check(plane)
    change_plane_status(plane, "ground")
    @hangar << plane
  end

  def take_off(plane)
    take_off_safety_check(plane)
    @hangar.delete(plane) 
    change_plane_status(plane, "air")
  end  

  def forecast?
    return false if rand(2).zero?

    true
  end

  def landing_safety_check(plane)
    fail "Airport is full" if @hangar.length >= @capacity
        
    fail "This plane isn't flying" if plane.status == "ground"

    fail "Bad weather! Landing is forbidden at this airport at the moment!" unless forecast?
  end

  def take_off_safety_check(plane)
    fail "This plane is already in the air" if plane.status == "air" 

    fail "This plane is NOT at this airport" unless @hangar.include?(plane)

    fail "Bad weather! Taking off is forbidden!" unless forecast?
  end

  def change_plane_status(plane, status)
    plane.status = status
  end

end
