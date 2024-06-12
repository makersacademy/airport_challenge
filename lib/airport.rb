class Airport 
    DEFAULT_CAPACITY = 1
    attr_reader :hangar 
    attr_accessor :capacity 
  def initialize(capacity = DEFAULT_CAPACITY)
     @capacity = capacity 
    @hangar = []
  end 
  
  def full? 
    if @hangar.length >= capacity
      true 
    else 
      false 
    end 
  end 
end 

