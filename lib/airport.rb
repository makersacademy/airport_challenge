require './lib/weather'

class Airport 

	DEFAULT_CAPACITY = 50

	def initialize(capacity = DEFAULT_CAPACITY, planes = [])
		@planes = planes
		@weather = Weather.new
		@capacity = capacity
	end 

	def stormy?
		@weather == "Stormy"
	end

	def receive(plane)
		raise "Plane already landed!" if plane.status == "Landed"
		raise "The airport is full!" if full?
		raise "Stormy conditions!" if stormy?
		@planes << plane
		plane.land
  end 

  def release(plane)
  	raise "Plane already flying!" if plane.status == "Flying"
  	raise "Stormy conditions!" if stormy?
  	raise "Plane not in the airport!" unless @planes.include?(plane)
  	@planes.delete(plane)
  	plane.take_off
  end 

	def full?
		planes.count >= DEFAULT_CAPACITY
	end 
attr_accessor :planes, :capacity, :weather

end 
