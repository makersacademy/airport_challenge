class Airport

    attr_accessor :airplanes

    def initialize
    @airplanes = []
    end


    def land(plane)
        raise "The airport is full"
    end

    def take_off(plane)
        raise "There are no planes" if @airplanes.empty?
    end

end