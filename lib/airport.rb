class Airport

    def initialize
        @register = []
    end

    def land(plane)
        @register << (plane)
    end

    def show_register
        p @register
    end

end
