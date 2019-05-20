require 'plane'
require 'weather'


class Airport
    attr_reader :hanger

    def initialize 
      @hanger = []  
      
    end

    def land(plane)
      
        @hanger << plane
     
    end

    def take_off(plane)
      if :weather == "sunny"
        @hanger.delete(plane)
      end
    end


  end