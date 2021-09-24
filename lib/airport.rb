class Airport

    def initialize
        @register = []
    end

    def land(plane)
        @register << (plane)
    end

    def take_off(plane)
        if @register.include?(plane) == true
          @register.delete(plane)
          p "The #{plane} left the airport"
        else
          puts "Error! Airplane not at the aiport!!"
        end
    end

    def show_register
        p @register
    end

end

