class Airport

    def initialize
        @register = []
    end

    def land(plane)
        @register << (plane)
    end

    def take_off(plane)
        @register.delete(plane)
        p "The #{plane} left the airport"
    end

    def show_register
        p @register
    end

end

new = Airport.new
new.land("A380")
new.take_off("A380")