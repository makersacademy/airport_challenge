require_relative 'Airport'

class Plane
    def initialize
    end

    def Land(airport)
        airport.planes << self
    end
end