require_relative 'Airport'

class Plane
    attr_reader :isFlying
    def initialize
        @isFlying = false
    end

    def Land(airport)
        airport.planes << self
        @isFlying = false
    end

    def TakeOff(airport)
        airport.planes.each_with_index do |plane, index|
            if plane == self
                airport.planes.delete_at(index)
            end
        end
        @isFlying = true
    end
end