class Airport
    attr_reader :planes
    def initialize
      @plane_list = []
      @weather = weather
    end

    def land_plane(plane)
        @plane_list << plane
    end
    
    def take_off
        landed_planes = @plane_list.length
        current_weather = weather
        if current_weather == "Stormy"
            raise "Sorry, planes cannot take off in stormy weather."
        else
            @plane_list.pop
        end
        if landed_planes.-(1) == @plane_list.length
            return "Flight has departed."
        end
    end

    def weather
        the_weather = Kernel.rand(1..40)
        if the_weather == 1
            return "Stormy"
        else
            return "Sunny"
        end
    end
end
