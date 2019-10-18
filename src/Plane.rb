require_relative 'Airport'

class Plane
    attr_reader :isFlying
    def initialize
        @isFlying = true
    end

    def Land(airport, weather)
        if weather != "Stormy"
            airport.planes << self
            @isFlying = false
        end
    end

    def TakeOff(airport, weather)
        if weather != "Stormy"
            airport.planes.each_with_index do |plane, index|
                if plane == self
                    airport.planes.delete_at(index)
                end
            end
            @isFlying = true
        end
    end
end