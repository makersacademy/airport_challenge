require_relative 'plane'

class Airport
  def initialize(capacity)
    @capacity = capacity
    @hangar = []
  end
<<<<<<< HEAD

  def land(plane)
    raise "Airport is full" if full
    
=======
  
  def land(plane)
    raise "Airport is full" if @hangar.length <= @capacity
>>>>>>> b3e1655dcf088c404e6b3530ca8c5a8ae9469ff1
    @hangar << plane
  end

  def take_off(plane)
    "The plane: #{plane} has taken off"
  end

  private

  def full
    @hangar.length >= @capacity
  end

end
