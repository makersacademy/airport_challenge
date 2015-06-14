class Weather

	attr_accessor :generator

	def initialize
		@generator=rand(100)
	end

	def Sunny?
		generator < 80
	end

	def Stormy?
		!Sunny?
	end
end