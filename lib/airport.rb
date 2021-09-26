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
    @weather >= 9 ? true : false
  end
  
  def full?
    @hangar.length >= @capacity ? true : false
  end 
end


# Upon initializing, you can add plane instances to the airport
# These plane instances will automatically be put into the hangar 
# And their @grounded value will be set to true
# When planes are created, they are automatically in the sky
# Unless I create them inside an airport instance in which case they will be grounded
# An airport cannot lose a plane it does not have, but it can receive one it does not have
# Therefore planes should be automically in flight upon creation 
# Unless they are created when initalizing an airport instance
