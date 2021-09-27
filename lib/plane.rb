class Plane

    attr_accessor :name

    def initialize 
        @name = "Airbus " + rand(1..500).to_s
    end

end