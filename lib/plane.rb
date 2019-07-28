require 'weather' 
require 'pry'

class Plane
    attr_accessor :departed

    def initialize
        #by default it is created on the ground (land)
        @departed = false 
    end
    
    def land
        # if @can_land
        if @departed == true && is_not_stormy?
            @departed = false
            true
        else
            false
        end     
    end

    def takeoff
        if @departed == false && is_not_stormy?
            @departed = true
            true
        else
            false
        end
    end

    def is_not_stormy?
        Weather.new.stormy? == false
    end
end