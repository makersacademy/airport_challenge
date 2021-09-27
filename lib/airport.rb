require_relative 'plane'
require_relative 'weather'

class Airport
    DEFAULT_CAPACITY = 100

    attr_accessor :hangar, :capacity, :weather, :name

    def initialize (capacity = DEFAULT_CAPACITY, name = 'London Heathrow', weather = Weather.new)
        @hangar =[]
        @capacity = capacity
        @weather = weather
        @name = name
    end

    def land(plane)
        raise "Airport is full" if full
        raise "Weather is bad, cannot land plane" if weather.bad?
        hangar << plane.name 
    end

    def take_off
        raise "Weather is bad, plane cannot take off" if weather.bad?
        hangar.pop
    end

    def full
        hangar.length >= capacity
    end

end