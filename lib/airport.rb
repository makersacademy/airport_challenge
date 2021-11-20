require 'plane.rb'

class Airport

    attr_reader :storage

    def initialize
        @storage = []
        @capacity = 20
    end

    def plane_landing(plane)
        if @storage.count > 19
            raise "The airport is full!"
        end
        @storage << plane
    end

    def plane_taking_off(plane)
        index = @storage.index plane
        @storage.delete_at(index)
    end
end