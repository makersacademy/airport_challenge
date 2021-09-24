class Airport

    def initialize
        @register = []
        @capacity = 3
    end

    def land(plane)
        @register.count < @capacity ? (@register << (plane)) : ( p "The airport is full!!" )
    end

    def take_off(plane)
        if @register.include?(plane) == true
          @register.delete(plane)
          p "The #{plane} left the airport"
        else
          p "Error! Airplane not at the aiport!!"
        end
    end

    def show_register
        p @register
    end

end

new = Airport.new
new.land("a")
new.land("b")
new.land("c")
new.show_register
new.land("d")
new.show_register
