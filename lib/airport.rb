class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :stormy, :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY )
    @planes = []
    @stormy = Weather.stormy?
    @capacity = capacity
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
   raise("you can t land it s stormy") if stormy == true
   raise("airport is full!") if full?
 end

 def take_off_error(plane)
   raise("plane already took off ") if plane.landed == false
   raise("this plane is not landed in this airport") if !planes.include?(plane)
   raise("you can t take_off it s stormy") if stormy == true
 end

 def change_status(plane)
   if plane.landed == false
     plane.landed = true
   else
     plane.landed = false
   end
 end

  def full?
    @planes.size == @capacity
  end


end
