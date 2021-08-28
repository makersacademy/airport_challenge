require_relative "../lib/airplane"

class AirPort
    
    #attr_reader :plane, :stormy
    attr_accessor :capacity, :stormy

    DEFAULT_CAPACITY = 3
    STORMY = false
    
    def initialize(capacity = DEFAULT_CAPACITY, stormy = STORMY)
        @capacity = capacity
        @runway = [] 
        @stormy = stormy        
    end

    def instruction(message)
        message
    end

    def confirmation_message(confirmation)
        confirmation
    end

    def land_to_runway(arriving_plane)
        fail_if_stormy
        fail 'Airport full' if full?
        @runway << arriving_plane
        @runway
    end

    def leave_runway(leaving_plane)
        fail_if_stormy
        @runway.delete_if{ |plane| plane == leaving_plane }
        confirmation_message("#{leaving_plane} has left")
        @runway
    end

    def fail_if_stormy
        #puts "this is where it gets to ...... #{stormy}"
        fail "Too Stormy" if stormy?
    end

    def report_stormy(report)
        @stormy = report
    end     

    def stormy?
        @stormy
    end
    
    private

    def full?
        @runway.count >= @capacity
    end

end