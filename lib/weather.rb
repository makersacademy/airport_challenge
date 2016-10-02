
class Weather

	def initialize (weather = true)
     @weather = weather
  end

	def what_weather
		@weather
	end 
end
=begin
weather = rand(10)

good_weather = Range.new(3,10)
bad_weather = Range.new(0,2)

if weather == good_weather
	true
else
	false
end 
=end