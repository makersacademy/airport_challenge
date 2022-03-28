require_relative 'plane'

class Airport
attr_accessor :hangar, :dock
    def initialize
        @hangar = []
    end

    def instruct_land(plane)
        @dock = {}
        key = plane
        dock[key] = "grounded"
        @hangar.push(dock)
    end

    def take_off(plane)
    end
end