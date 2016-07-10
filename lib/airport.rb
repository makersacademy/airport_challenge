require_relative 'plane'

class Airport

  attr_reader :airport

    def initialize
        @airport = []
    end

    def land_plane(plane)
      @airport << plane
    end

    def take_off
      @airport.pop
    end


end
