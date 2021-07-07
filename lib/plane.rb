class Plane
    attr_reader :flight_number
    def initialize
        @flight_number = (0...8).map { (65 + rand(26)).chr }.join
    end
end