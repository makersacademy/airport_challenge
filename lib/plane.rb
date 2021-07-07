class Plane
    attr_reader :flight_num
    
    def generate_flight_number
        @flight_num = (0...8).map {(65 + rand(26)).chr + rand(0...9).to_s}.join.to_s
    end
end