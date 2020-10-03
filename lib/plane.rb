require_relative 'airport'

class Plane

    attr_reader :status, :location

    def initialize
        @status = 'landed'
        @location = Airport.new
    end
end