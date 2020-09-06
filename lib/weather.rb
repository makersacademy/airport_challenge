module Weather

def weather 
    rand(2) == 1 ? @weather_condition = "Sunny" : @weather_condition = "Stormy"
end

end

=begin
class Weather



    def initialize()
        @weather_num =  rand(2)
        @weather_num == 1 ? @weather_condition = "Sunny" : @weather_condition = "Stormy"

    end

    def weather_condition?
        @weather_condition

    
    end



end
=end 