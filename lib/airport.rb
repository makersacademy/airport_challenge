require_relative 'plane'
require_relative 'weatherconditions'

class Airport

	include Weather_Conditions

	attr_reader :planes, :current_weather

	def initialize
		@planes = []
		@current_weather = :sunny
	end

	def land plane
		@planes << plane unless @planes.include?(plane) 
	end

	def take_off plane
		raise(RuntimeError) if self.current_weather == :stormy
		@planes.delete(plane) if @planes.include?(plane) && self.current_weather != :stormy
	end

end