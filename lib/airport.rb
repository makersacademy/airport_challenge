class Airport
  attr_reader :max_capacity, :hangar

  def initialize(max_capacity = 100)
    @max_capacity = max_capacity
    @hangar = Array.new 
  end 
  
  def add_plane(airplane)
    @hangar << airplane
  end 
  
  def full?
    @hangar.size >= @max_capacity
  end 
end 
