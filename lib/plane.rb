class Plane
    def generate_flight_number
        (0...8).map {(65 + rand(26)).chr + rand(0...9).to_s}.join.to_s
    end
end