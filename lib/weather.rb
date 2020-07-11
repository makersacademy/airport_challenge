# require_relative 'airport'
# require_relative 'plane'

class Weather
    def stormy?
        rand(1..2) == 1 ? true : false
    end
end
