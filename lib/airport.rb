require_relative 'plane'
require_relative 'weather'




class Airport 
  CAPACITY = 5
  attr_reader :hanger 
  attr_reader :weather 
  def initialize
  @hanger = []
  @weather = Weather.new 
  puts "The weather today is #{@weather.generate}"
  end 

    def land(plane)
      @hanger << plane #in irb this passes in the obj ref i.e. <gibberish> not "boeing1" for example, can somebody explain this
      @plane = plane
    end
  
  def takeoff(plane) 
    hanger.delete(plane) 
    "plane has taken off!"
  end 

end
