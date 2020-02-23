require '~/projects/airport_challenge/lib/plane.rb'

class Airport
    
    attr_reader :fleet

    def initialize
        @fleet = []
        build_fleet
        @airport_capacity = 10
        @weather_types = {
            1 => "sun",
            2 => "rain",
            3 => "snow",
            4 => "fog",
            5 => "storm"
        }
    end

    def build_fleet
        plane1 = Plane.new("air")
        @fleet.push(plane1)
        plane2 = Plane.new("air")
        @fleet.push(plane2)
        plane3 = Plane.new("air")
        @fleet.push(plane3)
    end

    def weather
        current_weather = rand(5) + 1
        return @weather_types[current_weather]
    end

    def land_plane(plane)

        current_weather = weather
        planes_at_airport = parked_planes

        if current_weather == "storm"
            false
        else
            if planes_at_airport >= @airport_capacity
                false
            else
                if plane.location == "airport"
                    false
                else
                    plane.instance_variable_set(:@location, "airport")
                    true
                end
            end
        end

    end
    
    def take_off(plane)
        #check if the plane is at the airport
        if plane.location == "airport"
            #check the weather 
            current_weather = weather
                        
            if current_weather == "storm"
            return false
            else
                plane.instance_variable_set(:@location, "air")
                return true
            end
        else
            false
        end
       
    end

    def parked_planes
        planes = 0
        @fleet.each { |plane| 
            if plane.location == "airport"
                planes += 1
            end
        }
        return planes
    end

    def set_capacity(capacity)
        @airport_capacity = capacity
    end

end