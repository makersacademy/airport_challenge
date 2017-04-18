class Airplane

	attr_reader :flying

	def initialize(flying = true)
		@flying = flying
  	end

  	def land
  		@flying = false
  	end		

  	def take_off
  		@flying = true
  	end

  	def flying?
  		@flying
  	end	
end	