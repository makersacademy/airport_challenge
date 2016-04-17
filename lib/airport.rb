require_relative 'plane'

class Airport
    
    attr_accessor :hangar, :weather, :capacity
    
    DEFAULT_CAPACITY = 20
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @hangar = []
        @weather = weather_set
        @capacity = capacity
    end
    
    def land(plane)
        fail 'airport is at capacity' if full?
        fail 'It\'s too stormy to land!' if weather == 'stormy'
        hangar << plane unless hangar.include? plane
    end
    
    def take_off
        fail 'It\'s too stormy!' if weather == 'stormy'
        fail 'airport is devoid of planes' if empty?
        hangar.pop
    end
    
    def weather?
        @weather = weather_set
    end
    
    def weather_check
        if rand(10) == 0
            weather = 'stormy'
        else
            weather = 'sunny'
        end
    end
    
    private
     
    def full?
        hangar.length >= capacity
    end
    
    def empty?
        hangar.empty?
    end
    
    def weather_set
        if rand(4) == 0
            weather = 'stormy'
        else
            weather = 'sunny'
        end
    end
    
end