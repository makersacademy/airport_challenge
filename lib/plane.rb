require_relative 'airport'

class Plane

    attr_reader :status, :location, :destination

    def initialize
        @status = 'landed'
        @location = Airport.new
        @destination = Airport.new
    end
end