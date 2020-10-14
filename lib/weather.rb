class Weather

    # Sets chance of storm
    def initialize(storm_chance)
        @storm_chance = storm_chance * 10
    end

    # Checks if there is currently a storm
    def check_for_storm
        weather = rand(1..10)
        if weather <= @storm_chance
            return true
        else
            return false
        end
    end

end