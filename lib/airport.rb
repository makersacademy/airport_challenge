require_relative 'weather_station'

class Airport
	attr_reader :planes, :capacity

	DEFAULT_CAPACITY = 20

	def initialize(weather_station = WeatherStation.new, capacity = DEFAULT_CAPACITY)
		@weather_station = weather_station
		@planes = []
		@capacity = capacity
	end

	def issue_landing_permission(plane)
		raise "Permission for take off denied, due to poor weather conditions." if weather_check
		raise "Permission for landing denied, due to full airport capacity." if full?
		raise "The plane is already in the airport database." if present?(plane)
		plane.land
		planes << plane
	end

	def issue_take_off_permission(plane)
		raise "Permission for take off denied, due to poor weather conditions." if weather_check
		raise "The plane is not present in the airport database." if !present?(plane)
		planes.delete(plane)
		plane.take_off
	end

	private

	def weather_check
		@weather_station.poor_weather?
	end

	def present?(plane)
		planes.include?(plane)
	end

	def full?
		planes.length >= capacity
	end
end