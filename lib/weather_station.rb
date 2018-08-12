class WeatherStation

    attr_reader :conditions_safe

    WEATHER = ['calm', 'calm', 'calm', 'calm', 'stormy']

    def conditions_safe?
        WEATHER.sample == 'calm' ? true : false  
    end


end
