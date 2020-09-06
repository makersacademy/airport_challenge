class Airport
  # initializing capacity to define condition 'full' on US3
  def initialize(capacity) 
    @capacity = capacity # storing @capacity as instance variable so can be passed 
    @planes = [] # qty of planes landed stored in an array

  end

  def land(plane)
    raise 'Airport full, no more planes allowed' if full? 

    @planes << plane # inserting the plane that landed to the array of planes

  end

  def take_off(plane)
  end

  private # no need to call this method outside of the class, so calling 'private' section

  def full? 
    # creating a 'full?' method with question mark to return either true or false 
    # this is a predicate method 
    @planes.length >= @capacity
    # asking to raise the message above if the length of the array with planes in it 
    # satisfies the comparison

  end

end
