class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = false
  end

  def land(plane)
    landing_error(plane)
    change_status(plane)
    @planes << plane
  end

  def take_off(plane)
    take_off_error(plane)
    change_status(plane)
    @planes.delete(plane)
  end

  private

 def landing_error(plane)
   raise("plane already landed") if plane.landed == true
 end

 def take_off_error(plane)
   raise("plane already took off ") if plane.landed == false
   raise("this plane is not landed in this airport") if !planes.include?(plane)
 end

 def change_status(plane)
   if plane.landed == false
     plane.landed = true
   else
     plane.landed = false
   end
 end


end
