class Airport
    attr_accessor :spaces
    def initialize
        @spaces = 3
    end 

    def taxi
        if @spaces == 0
            raise "No space for new aircraft"
        else
            @spaces -= 1
        end
    end
end