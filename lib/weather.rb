
class Weather

	def initialize
    @weather = Random.new
    @weather.rand(2)

    if @weather == 0
    		@bad_weather = false
    else
    		@good_weather = true 
    end 
     # = Weather.new(rand(10))
  end
end
