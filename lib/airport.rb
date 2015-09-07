require_relative 'plane'
class Airport
DEFAULT_CAPACITY = 20
  
  attr_accessor :capacity, :planes  #our plane's place and it's capacity 
	
  def initialize(capacity = DEFAULT_CAPACITY) # initialize our var 
		@planes = []                # array
		@capacity = capacity        # capacity
	end 

    def to_land(plane)    # conditions of plan landing
    fail 'Airport is full' if full? 
    fail "Plane can't land, because of the stormy weather" if weather <= 3
    @planes << plane             # fill our array of planes
    plane.land                   # plane on the ground flying = false
	end 

	  def take_off(plane)
    fail "Can't take off in stormy weather" if weather <= 3
    #fail 'No planes in the airport' if empty?  # no planes are ready for take off
    @planes.pop                     # release our plane 
    plane.take_off                  # plane becomes flying 
	end 

 # def empty?
  #  @planes.empty?
  #end
  
	def full?
		@planes.count >= DEFAULT_CAPACITY
	end 

def weather
@weather=rand(6)  
end
end 

