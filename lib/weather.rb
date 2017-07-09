class Weather
	attr_reader :sunny, :cloudy, :rainy, :stormy, :tornado

	def self.random_weather 
		Weather.instance_methods(false).sample
	end
end

