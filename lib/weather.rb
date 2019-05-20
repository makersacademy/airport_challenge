class Weather

    attr_reader :current_weather

    def initialise
        @current_weather
    end

    def current_weather?
        rand(1..6) > 5 ? true : false
        #true is stormy and false is sunny
    end

end

# this is the variable in my user stories