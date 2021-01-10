require_relative 'plane'

class Airport
    attr_accessor :hangar, :plane

    def initialize
        @hangar = []
    end

    def land(plane)
        @hangar.push(plane) 
    end

    def takeoff
        raise StandardError.new "Hangar is empty" if @hangar.empty?
        @hangar.pop
    end

end