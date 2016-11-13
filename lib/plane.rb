class Plane

attr_reader :flight_number

def initialize(flight_number = 1001 + rand(9000))
@flight_number = flight_number
end

end
