require_relative "../lib/airplane"

class AirPort

    attr_reader :plane

    def initialize
        @runway = []
    end

    def instruction(message)
        message
    end

    def confirmation_message(confirmation)
        puts "confirmation"
        confirmation
    end

    def land_to_runway(arriving_plane)
        @runway << arriving_plane
        @runway
    end

    def leave_runway(leaving_plane)
        @runway.delete_if{ |plane| plane == leaving_plane }
        confirmation_message("#{leaving_plane} has left")
        @runway
    end

end