class Airport 
  attr_reader :hangar, :capacity, :sky
  attr_accessor :weather
  def initialize(capacity = 15)
    @hangar = []
    @capacity = capacity 
    @weather = rand(1..10)
  end 

  def receive(plane)
    raise "The airport is full" if @hangar.length >= @capacity
    raise "The weather is too stormy to land" if @weather >= 9 
    plane.land 
    @hangar << plane
  end 

  def lose(plane)
    raise "#{plane} is not at this airport" unless @hangar.include?(plane) 
    raise "The airport is empty" if @hangar.empty? == true
    raise "The weather is too stormy to take off" if @weather >= 9
    @hangar.delete(plane)
    plane.take_off
  end
end 
