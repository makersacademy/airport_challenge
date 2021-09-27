class Airport 
  attr_reader :hangar
  attr_accessor :weather, :capacity 

  DEFAULTY_CAPACITY = 15

  def initialize(*planes)
    @capacity = DEFAULTY_CAPACITY
    @hangar = []
    planes.each do |plane| 
      plane.grounded = true 
      @hangar << plane 
    end 
    @weather = rand(1..10)
  end 

  def receive(plane)
    raise "The airport is full" if full?
    raise "The weather is too stormy to land" if stormy? 
    plane.land 
    @hangar << plane
  end 

  def lose(plane)
    raise "#{plane} is not at this airport" unless @hangar.include?(plane) 
    raise "The airport is empty" if @hangar.empty?
    raise "The weather is too stormy to take off" if stormy?
    @hangar.delete(plane)
    plane.take_off
  end

  private 

  def stormy?
    @weather >= 9 # Extreme stormy weather is a 9 or 10
  end
  
  def full?
    @hangar.length >= @capacity
  end 
end
