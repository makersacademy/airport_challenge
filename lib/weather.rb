class Weather 
	
	def initialize
	  @weather = ["Sunny", "Stormy"].sample
	end 

	#private
	
	attr_reader :weather

end 
