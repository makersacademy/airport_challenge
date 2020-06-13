class Weather
    attr_reader = @safe_to_fly
    def initialize(result = [true,false].sample)
        @safe_to_fly = result
    end

end