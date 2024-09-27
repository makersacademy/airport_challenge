require './lib/weather_1.rb'
class Airport

  include Weather

  attr_accessor :num_of_planes
  attr_accessor :capacity
 

  def initialize(num_of_planes= 0, capacity= 20)
    @num_of_planes = num_of_planes
    @capacity = capacity
  end 

  #def land(plane)
    #fail 'NO FLYING: STORMY WEATHER' if forecast == "stormy"  
    #fail 'The airport is full' if @num_of_planes >= @capacity
    #@num_of_planes = @num_of_planes + plane
  #end
  
  def land(plane)
    if forecast == "stormy"  
      fail 'NO FLYING: STORMY WEATHER'
    end
    if @num_of_planes >= @capacity
      fail 'The airport is full'
    end 
    @num_of_planes = @num_of_planes + plane
    
  end 

   
  #def take_off(plane)
    #@num_of_planes = @num_of_planes - plane
    #print "A plane has left the airport"
  #end 

  def take_off(plane)
    if forecast == "stormy"  
      fail 'NO FLYING: STORMY WEATHER'
    end
    
    @num_of_planes = @num_of_planes - plane
    print "A plane has left the airport"
  end 

end 

